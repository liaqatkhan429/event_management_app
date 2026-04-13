import 'package:event_management_app/views/utils/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

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
      customText("Business Group", fontWeight: FontWeight.w600, fontSize: 18,  color: Colors.white),
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
    );
  }
}
