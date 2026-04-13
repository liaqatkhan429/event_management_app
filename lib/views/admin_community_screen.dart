import 'package:event_management_app/views/group_profile_screen.dart';
import 'package:event_management_app/views/utils/appbutton.dart';
import 'package:event_management_app/views/vote_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_event.dart';

class AdminCommunityScreen extends StatefulWidget {
  const AdminCommunityScreen({super.key});

  @override
  State<AdminCommunityScreen> createState() => _AdminCommunityScreenState();
}

class _AdminCommunityScreenState extends State<AdminCommunityScreen> {

  String? isSelected;
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
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i){
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
                                child: Image.asset(
                                  "assets/f.png",
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [Colors.black.withValues(alpha: 0.1), Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Made in Melanin! Black History Month Social',
                                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                                    ),

                                    RadioGroup<String>(
                                      groupValue: isSelected,
                                      onChanged: (value) {
                                        setState(() {
                                          isSelected = value!;
                                        });
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          /// Row A
                                          Row(
                                            children: [
                                              customText("A",fontSize: 14,fontWeight: FontWeight.w500),

                                              Radio<String>(
                                                value: "A",
                                                activeColor: buttonColor,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  customText(
                                                      "Made in Melanin! Black History Month Social",
                                                      fontSize: 11.8, fontWeight: FontWeight.w400),
                                                  customText(
                                                      "12 vote",
                                                      fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff9F9F9F)),
                                                ],
                                              ),
                                            ],
                                          ),

                                          /// Row B
                                          Row(
                                            children: [
                                              customText("B",fontSize: 14,fontWeight: FontWeight.w500),
                                              Radio<String>(
                                                value: "B",
                                                activeColor: buttonColor,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  customText(
                                                      "Made in Melanin! Black History Month Social",
                                                      fontSize: 11.8, fontWeight: FontWeight.w400),
                                                  customText(
                                                      "12 vote",
                                                      fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff9F9F9F)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '12hr ago',
                                        style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xff9F9F9F)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
