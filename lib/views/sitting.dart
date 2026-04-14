
import 'package:event_management_app/views/update_profile.dart';
import 'package:event_management_app/views/utils/appbutton.dart';
import 'package:event_management_app/widgets/resuble_widgets.dart' hide customText, buttonColor;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/sitting.dart';
import 'notification_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Sitting> sittingList = [
      Sitting(image: "assets/notification.png", title: "Notifications"),
      Sitting(image: "assets/privacy.png", title: "Privicy Policy"),
      Sitting(image: "assets/privacy.png", title: "Term & Conditions"),
      Sitting(image: "assets/help.png", title: "Help & Support"),
      Sitting(image: "assets/share.png", title: "Invite Your Friend"),
      Sitting(image: "assets/dark.png", title: "Dark Mode"),
      Sitting(image: "assets/logout.png", title: "Logout"),

    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                "Settings",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              const SizedBox(height: 30),

              // Profile Card
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/p.png'),
                    ),
                    const SizedBox(height: 14),
                    customText(
                      "Morgan Mill",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),

                    const SizedBox(height: 4),
                    customText(
                      "example23@gmail.com",
                        fontSize: 14,
                        color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfileScreen()));
                      },
                      child: customButton2(
                          width: 133,
                          height: 52,
                          radius: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset("assets/edit.png",height: 24,width: 24,),
                                const SizedBox(width: 5),

                                customText("Edit profile",fontWeight: FontWeight.w700,fontSize: 14,color: Colors.white)
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 47),

              Expanded(
                child: ListView.builder(
                    itemCount: sittingList.length,
                    itemBuilder: (context, i){
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              if(i == 0){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                              }
                            },
                            child: Row(
                              children: [
                                Image.asset(sittingList[i].image,height: 24,width: 24,),
                                const SizedBox(width: 10),
                                customText(sittingList[i].title,fontWeight: FontWeight.w500,fontSize: 16,
                                  color: i == 6 ? buttonColor : Color(0xff272727),
                                ),
                                const Spacer(),
                                Icon(Icons.arrow_forward_ios_sharp,size: 20, color: Color(0xff4D4D4D),)
                              ],
                            ),
                          ),

                          const Divider(
                            thickness: 0.4,
                            color: Color(0xffA2A2A2),
                          ),
                          const SizedBox(height: 14,),
                        ],
                      );

                }),
              ),




            ],
          ),
        ),
      ),
    );
  }
}