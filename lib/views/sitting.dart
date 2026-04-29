import 'package:event_management_app/provider/user.dart';
import 'package:event_management_app/views/help_and_support.dart';
import 'package:event_management_app/views/invite_friends.dart';
import 'package:event_management_app/views/login_screen.dart';
import 'package:event_management_app/views/privacy_policy.dart';
import 'package:event_management_app/views/terms_and_condition.dart';
import 'package:event_management_app/views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/sitting.dart';
import '../services/auth.dart';
import '../widgets/reuseble_widgets.dart';
import 'dart_mode_screen.dart';
import 'notification_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Sitting> sittingList = [
      Sitting(image: "assets/notification.png", title: "Notifications"),
      Sitting(image: "assets/privacy.png", title: "Privacy Policy"),
      Sitting(image: "assets/privacy.png", title: "Term & Conditions"),
      Sitting(image: "assets/help.png", title: "Help & Support"),
      Sitting(image: "assets/share.png", title: "Invite Your Friend"),
      Sitting(image: "assets/dark.png", title: "Dark Mode"),
      Sitting(image: "assets/logout.png", title: "Logout"),

    ];

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xFF555555),
                ),
              const SizedBox(height: 30),

              // Profile Card
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 82,
                      width: 82,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black12.withValues(alpha: 0.1),
                          width: 2,
                        ),
                        image: DecorationImage(
                            image: userProvider.getUser().profileImage != null
                                ? NetworkImage(userProvider.getUser().profileImage!)
                                : const AssetImage("assets/user2.png") as ImageProvider,
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    customText(
                      userProvider.getUser().userName ?? "User",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      ),

                    const SizedBox(height: 4),
                    customText(
                      userProvider.getUser().email.toString(),
                        fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Color(0xFF555555),
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
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sittingList.length,
                    itemBuilder: (context, i){
                      return Column(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () async{
                              if(i == 0){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                              }
                              if(i == 1){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));
                              }

                              if(i == 2){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditionsScreen()));
                              }
                              if(i == 3){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupportScreen()));
                              }
                              if(i == 4){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InviteFriendsScreen()));
                              }
                              if(i == 5){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DarkModeScreen()));
                              }

                              if(i == 6) {

                                  try{
                                    isLoading = true;
                                    setState(() {});
                                    await AuthServices().signOut().then((val){
                                      isLoading = false;
                                      setState(() {});
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (_) => LoginScreen()),
                                            (route) => false,
                                      );
                                      showSnackBar(context, "Logged Out Successfully");
                                    });
                                  }catch(e){
                                    isLoading = false;
                                    setState(() {});
                                    showSnackBar(context, e.toString());
                                  }

                              }
                            },
                            child: Row(
                              children: [
                                Image.asset(sittingList[i].image,height: 24,width: 24,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Color(0xFF555555),
                                ),
                                const SizedBox(width: 10),
                                customText(sittingList[i].title,fontWeight: FontWeight.w500,fontSize: 16,
                                  color: i == 6
                                      ? buttonColor
                                      : Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : const Color(0xFF272727),
                                ),
                                const Spacer(),
                                Icon(Icons.arrow_forward_ios_sharp,size: 20,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Color(0xFF4D4D4D),
                                )
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