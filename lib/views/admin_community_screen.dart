import 'package:event_management_app/model/vote.dart';
import 'package:event_management_app/services/vote.dart';
import 'package:event_management_app/views/group_profile_screen.dart';
import 'package:event_management_app/views/vote_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/reuseble_widgets.dart';
import 'create_event.dart';

class AdminCommunityScreen extends StatefulWidget {
  const AdminCommunityScreen({super.key});

  @override
  State<AdminCommunityScreen> createState() => _AdminCommunityScreenState();
}

class _AdminCommunityScreenState extends State<AdminCommunityScreen> {

  Map<String, String> selectedVotes = {};
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 62, left: 24, right: 24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/user.png"),
              ),
              const SizedBox(width: 10),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GroupProfileScreen()));
                  },
                  child: customText("Business Group", fontWeight: FontWeight.w600, fontSize: 18,  color: Colors.white)),
              const Spacer(),
              Icon(Icons.more_vert, color: Colors.white)
            ],
          ),
        ),
      ),
      body:  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgroup.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 11,),
              customText("Today", fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff7B7B7B)),
              const SizedBox(height: 16,),
              Expanded(
                child: StreamProvider<List<VoteModel>>.value(
                    value: VoteServices().getQuestions(),
                    initialData: [],
                builder: (context, child){
                      final list = context.watch<List<VoteModel>>();

                      if(list.isEmpty){
                        return Center(child:  Text(
                          "No Data Found.!",
                          style: GoogleFonts.poppins(fontSize: 15.8, fontWeight: FontWeight.w600),
                        ),);
                      }
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, i){
                            String timeAgoShort(int timestamp) {
                              final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
                              final diff = DateTime.now().difference(date);

                              if (diff.inSeconds < 60) return "Just now";
                              if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
                              if (diff.inHours < 24) return "${diff.inHours}hr ago";
                              if (diff.inDays < 7) return "${diff.inDays}d ago";
                              return "${(diff.inDays / 7).floor()}w ago";
                            }

                            return  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: Color(0xffBABABA)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: list[i].image == null || list[i].image!.isEmpty
                                          ? Container(
                                        height: 180,
                                        width: double.infinity,
                                        color: Colors.grey[300],
                                        child: Icon(Icons.image, size: 50, color: Colors.grey),
                                      )
                                          : Image.network(
                                        list[i].image.toString(),
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,


                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Container(
                                            height: 180,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            child: CircularProgressIndicator(),
                                          );
                                        },


                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            height: 180,
                                            width: double.infinity,
                                            color: Colors.grey[300],
                                            child: Icon(Icons.broken_image, size: 50),
                                          );
                                        },
                                      )
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[i].question.toString(),
                                            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                                          ),

                              RadioGroup<String>(
                                groupValue: selectedVotes[list[i].docId],
                                onChanged: (value) async {
                                  String previousValue = selectedVotes[list[i].docId] ?? "";

                                  setState(() {
                                    selectedVotes[list[i].docId.toString()] = value!;
                                  });

                                  /// CASE 1: User selects A
                                  if (value == "A") {
                                    if (previousValue == "B") {
                                      await VoteServices().removeFromVoteB(
                                        voteID: list[i].docId.toString(),
                                        userID: userId,
                                      );
                                    }


                                    if (previousValue != "A") {
                                      await VoteServices().addToVoteA(
                                        voteID: list[i].docId.toString(),
                                        userID: userId,
                                      );
                                    }
                                  }

                                  /// CASE 2: User selects B
                                  if (value == "B") {
                                    if (previousValue == "A") {
                                      await VoteServices().removeFromVoteA(
                                        voteID: list[i].docId.toString(),
                                        userID: userId,
                                      );
                                    }


                                    if (previousValue != "B") {
                                      await VoteServices().addToVoteB(
                                        voteID: list[i].docId.toString(),
                                        userID: userId,
                                      );
                                    }
                                  }
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    /// Row A
                                    Row(
                                      children: [
                                        customText("A", fontSize: 14, fontWeight: FontWeight.w500,
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),

                                      Radio<String>(
                                            value: "A",
                                          fillColor:  WidgetStateProperty.resolveWith((states) {
                                            if (states.contains(WidgetState.selected)) {
                                              return buttonColor;
                                            }
                                            return Color(0xff555555);
                                          },),
                                          side: BorderSide(
                                            color: Color(0xff555555),
                                            width: 0.6,
                                          )
                                          ),


                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                              list[i].optionOne.toString(),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white
                                                 : Color(0xff424242),
                                            ),
                                            customText(
                                              "${list[i].countA?? 0} Votes",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white
                                                  : Color(0xff9F9F9F),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    /// Row B
                                    Row(
                                      children: [
                                        customText("B", fontSize: 14, fontWeight: FontWeight.w500,color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black,),

                                        Radio<String>(
                                          value: "B",
                                          fillColor:  WidgetStateProperty.resolveWith((states) {
                                            if (states.contains(WidgetState.selected)) {
                                              return buttonColor;
                                            }
                                            return Color(0xff555555);
                                          },),
                                          side: BorderSide(
                                            color: Color(0xff555555),
                                            width: 0.6,
                                          ),
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            customText(
                                              list[i].optionTwo.toString(),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white
                                                  : Color(0xff424242),
                                            ),
                                            customText(
                                              "${list[i].countB ?? 0} Votes",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white
                                                  :  Color(0xff9F9F9F),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child:Text(
                                              timeAgoShort(list[i].createdAt!.toDate().millisecondsSinceEpoch),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                },
                )
              ),
            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ///vote
          SizedBox(
            width: 63,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VoteScreen()));
              },
              backgroundColor: buttonColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Image.asset("assets/vote.png", height: 24,width: 24,),
                    customText("Vote",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 63,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEventScreen()));
              },
              backgroundColor: buttonColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Icon(Icons.add, color: Colors.white,size: 24,),
                    customText("Event",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
