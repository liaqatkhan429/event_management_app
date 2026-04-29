import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/event.dart';
import '../services/event.dart';
import '../widgets/reuseble_widgets.dart';
import 'event_screen.dart';

class GroupProfileScreen extends StatefulWidget {
  const GroupProfileScreen({super.key});

  @override
  State<GroupProfileScreen> createState() => _GroupProfileScreenState();
}

class _GroupProfileScreenState extends State<GroupProfileScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
appBar: PreferredSize(
    preferredSize: Size.fromHeight(360), child: Column(
  children: [
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 157,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black12
                : Colors.red,
            image: const DecorationImage(
              image: AssetImage("assets/backgroup.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Color(0xffFFFFFF1A),
                BlendMode.srcATop,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/backarrow.png",
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                customText(
                  "Group Profile",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
        ),


        Positioned(
          top: 140,
          left: 0,
          right: 0,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Positioned(
          top: 102,
          left: 0,
          right: 0,
          child: Container(
            height: 94,
            width: 94,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/home2.png"),fit: BoxFit.contain)
            ),

          ),
        ),
      ],
    ),
    const SizedBox(height: 55),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          customText(
            "Business Group",
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          const SizedBox(height: 6,),
          customText(
              "Lorem ipsum dolor sit amet consectetur. Cras elit volutpat morbi mauris tincidunt lacus.",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff555555)

          ),
          const SizedBox(height: 12,),
          customButton(
              text: "14k members",
              txtColor: Color(0xffCF3232),
              height: 42,
              width: 152,
              color: Colors.red.shade200
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: customText(
              "Group Events",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),

        ],
      ),
    ),
  ],
)),
body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Expanded(
    child: StreamProvider.value(
      value: EventServices().getEvents(),
      initialData: [EventModel()],
      builder: (context, child){
        List<EventModel> eventList = context.watch<List<EventModel>>();
        return ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, i){

              String formattedDate = DateFormat('dd MMMM yyyy').format(eventList[i].dateTime!.toDate());
              String formattedTime = DateFormat(' hh:mm a').format(eventList[i].dateTime!.toDate() );
              return Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen(events: eventList[i],)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Color(0xffBABABA)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    eventList[i].image.toString(),
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [Colors.black.withValues(alpha: 0.1), Colors.transparent],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: InkWell(
                                      onTap: () async {
                                        try{
                                          if(eventList[i].favorite!.contains(userId)){
                                            await EventServices().removeFromFavorite(
                                                eventID: eventList[i].docId.toString(),
                                                userID: userId);
                                          }else{
                                            await EventServices().addToFavorite(
                                                eventID: eventList[i].docId.toString(),
                                                userID: userId);
                                          }
                                        }catch(e){
                                          showSnackBar(context, e.toString());
                                        }
                                      },
                                      child: eventList[i].favorite!.contains(userId)
                                          ? Icon(Icons.favorite, color: Colors.red,)
                                          : Image.asset("assets/fivorite.png", height: 24,width: 24,color: Colors.white,)),
                                ),
                              ],
                            ),

                            // Event details
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventList[i].title.toString(),
                                    style: GoogleFonts.poppins(fontSize: 15.8, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children:  [
                                      Icon(Icons.calendar_today_outlined, size: 15, ),
                                      SizedBox(width: 8),
                                      /// Date
                                      customText(
                                          formattedDate,
                                          fontSize: 14, fontWeight: FontWeight.w400,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),

                                      ///Time
                                      customText(
                                          formattedTime,
                                          fontSize: 14, fontWeight: FontWeight.w400,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children:  [
                                      Icon(Icons.location_on_outlined, size: 18, ),
                                      SizedBox(width: 8),
                                      customText(
                                          eventList[i].location.toString(),
                                          fontSize: 14, fontWeight: FontWeight.w400,
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  customButton(text: "Add to my calendar")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                ],
              );
            });
      },
    ),
  ),
),
    );
  }
}
