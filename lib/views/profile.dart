
import 'package:event_management_app/views/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),

                // Profile Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                        ),
                        child: const CircleAvatar(
                          radius: 42,
                          backgroundImage: AssetImage('assets/p.png'),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Morgan Mill",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "example23@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(height: 52,width: 133,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffD61F1F),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                          label: Text(
                            "EditProfile", // Added space between words
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),


                const SizedBox(height: 16),
                InkWell(
                  child: SizedBox(height: 40,
                    child: ListTile(
                      leading: Image.asset("assets/n.png",height: 24,width: 24,),
                      title: Text("Notifications",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                  },
                ),
                Divider(),
                SizedBox(height: 40,
                  child: ListTile(
                    leading: Image.asset("assets/c.png",height: 24,width: 24,),
                    title: Text("Privicy Policy",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),  SizedBox(height: 40,
                  child: ListTile(
                    leading: Image.asset("assets/q.png",height: 24,width: 24,),
                    title: Text("Help & support",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),  SizedBox(height: 40,
                  child: ListTile(
                    leading: Image.asset("assets/s.png",height: 24,width: 24,),
                    title: Text("Invite your Friend",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),
                SizedBox(height: 40,
                  child: ListTile(
                    leading: Image.asset("assets/m.png",height: 24,width: 24,),
                    title: Text("Dark Mode",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Divider(),
                SizedBox(height: 40,
                  child: ListTile(
                    leading: Image.asset("assets/l.png",height: 24,width: 24,),
                    title: Text("Logout",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 16),),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }

}