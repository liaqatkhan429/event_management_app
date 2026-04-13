import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/resuble_widgets.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/backarrow.png",
                      height: 24,
                      width: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  customText(
                    "Vote",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  const SizedBox(height: 24),
                  customText(
                    "Question",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Made in Melanin! Black History Month Social",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
          
                  customText(
                    "Options",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Option 1",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Option 2",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  customText(
                    "Upload Image",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 154,
                    height: 127,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff838383),
                          width: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 27),
                        Image.asset("assets/upload.png"),
                        const SizedBox(height: 10),
                        customText(
                            "Upload",
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff555555)
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 200),
          
                  customButton(text: "Vote"),
                  const SizedBox(height: 24),
          
          
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
