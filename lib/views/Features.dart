import 'package:event_management_app/views/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/resuble_widgets.dart';
import 'home_screen.dart';

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 62,),
            Row(
              children: [
                customText(
                  "Features",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String? selectedGroup;

                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Dialog(
                              insetPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 130),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.close)),
                                          const SizedBox(width: 101),
                                          customText(
                                            "Filter Events",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 23),
                                      customText(
                                        "City",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(height: 6),
                                      CustomDropdown(
                                        hintText: "Select City",
                                      ),
                                      const SizedBox(height: 23),
                                      customText(
                                        "State",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(height: 6),
                                      CustomDropdown(
                                        hintText: "Select City",
                                      ),
                                      const SizedBox(height: 23),
                                      customText(
                                        "Groups",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(height: 6),
                                      CustomDropdown(hintText: "Group"),
                                      const SizedBox(height: 23),
                                      Row(
                                        children: [
                                          /// Religious
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedGroup = "Religious";
                                              });
                                            },
                                            child: customButton2(
                                              width: 96,
                                              height: 35,
                                              color: selectedGroup == "Religious"
                                                  ? buttonColor
                                                  : Colors.transparent,
                                              borderColor: selectedGroup == "Religious"
                                                  ? Colors.transparent
                                                  : const Color(0xff545454),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    "assets/religion.png",height: 20,width: 20,
                                                    color: selectedGroup == "Religious"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                  customText(
                                                    "Religious",
                                                    fontSize: 12,
                                                    color: selectedGroup == "Religious"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 6),

                                          /// Business
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedGroup = "Business";
                                              });
                                            },
                                            child: customButton2(
                                              width: 96,
                                              height: 35,
                                              color: selectedGroup == "Business"
                                                  ? buttonColor
                                                  : Colors.transparent,
                                              borderColor: selectedGroup == "Business"
                                                  ? Colors.transparent
                                                  : const Color(0xff545454),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    "assets/business.png",height: 20,width: 20,
                                                    color: selectedGroup == "Business"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                  customText(
                                                    "Business",
                                                    fontSize: 12,
                                                    color: selectedGroup == "Business"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 6),

                                          /// Religious 2
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedGroup = "Religious2";
                                              });
                                            },
                                            child: customButton2(
                                              width: 96,
                                              height: 35,
                                              color: selectedGroup == "Religious2"
                                                  ? buttonColor
                                                  : Colors.transparent,
                                              borderColor: selectedGroup == "Religious2"
                                                  ? Colors.transparent
                                                  : const Color(0xff545454),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    "assets/religious.png",height: 20,width: 20,
                                                    color: selectedGroup == "Religious2"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                  customText(
                                                    "Religious",
                                                    fontSize: 12,
                                                    color: selectedGroup == "Religious2"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 12),

                                      Row(

                                        children: [
                                          /// Education
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedGroup = "Education";
                                              });
                                            },
                                            child: customButton2(
                                              width: 109,
                                              height: 35,
                                              color: selectedGroup == "Education"
                                                  ? buttonColor
                                                  : Colors.transparent,
                                              borderColor: selectedGroup == "Education"
                                                  ? Colors.transparent
                                                  : const Color(0xff545454),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    "assets/education.png",height: 20,width: 20,
                                                    color: selectedGroup == "Education"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                  customText(
                                                    "Education",
                                                    fontSize: 12,
                                                    color: selectedGroup == "Education"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 6),

                                          /// Community
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedGroup = "Community";
                                              });
                                            },
                                            child: customButton2(
                                              width: 109,
                                              height: 35,
                                              color: selectedGroup == "Community"
                                                  ? buttonColor
                                                  : Colors.transparent,
                                              borderColor: selectedGroup == "Community"
                                                  ? Colors.transparent
                                                  : const Color(0xff545454),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                    "assets/community.png",height: 20,width: 20,
                                                    color: selectedGroup == "Community"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                  customText(
                                                    "Community",
                                                    fontSize: 12,
                                                    color: selectedGroup == "Community"
                                                        ? Colors.white
                                                        : const Color(0xff545454),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedGroup = "";
                                                });
                                              },
                                              child: customButton(text: "Clear Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132,color: Colors.transparent,txtColor: Color(0xff555555),borderColor: Colors.black)),
                                          customButton(text: "Apply Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Image.asset("assets/filter.png",height: 42,width: 42,),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i){
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventScreen()));
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
                              // Image with overlay & heart icon
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/f.png",
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
                                    child: Image.asset("assets/fivorite.png", height: 24,width: 24,color: Colors.white,),
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
                                      'Made in Melanin! Black History Month Social...',
                                      style: GoogleFonts.poppins(fontSize: 15.8, fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children:  [
                                        Icon(Icons.calendar_today_outlined, size: 15, ),
                                        SizedBox(width: 8),
                                        customText(
                                            '28 October 2025 6:00pm GMT',
                                            fontSize: 14, fontWeight: FontWeight.w400),

                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children:  [
                                        Icon(Icons.location_on_outlined, size: 18, ),
                                        SizedBox(width: 8),
                                        customText(
                                            '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                                            fontSize: 14, fontWeight: FontWeight.w400),
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
              }),
            ),
          ],
        ),
      )
    );
  }
}