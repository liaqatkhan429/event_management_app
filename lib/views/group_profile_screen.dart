import 'package:event_management_app/views/utils/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupProfileScreen extends StatelessWidget {
  const GroupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: SingleChildScrollView(
  child: Column(
    children: [
      Stack(
        clipBehavior: Clip.none, 
        children: [
          Container(
            height: 177,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
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
                    "Business Group",
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
            top: 157,
            left: 0,
            right: 0,
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          Positioned(
            top: 112,
            left: 0,
            right: 0,
            child: Container(
              height: 94,
              width: 94,
              decoration: BoxDecoration(
               shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/notification.png"),fit: BoxFit.contain)
              ),
  
            ),
          ),
        ],
      ),
      const SizedBox(height: 60),
   Padding(
     padding: const EdgeInsets.symmetric(horizontal: 15),
     child: Column(
       children: [
         customText(
           "Business Group",
           fontWeight: FontWeight.w600,
           fontSize: 18,
  
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
         height: 42,
           width: 152,
           color: Color(0xffCF3231)
         ),
         const SizedBox(height: 24),
         Align(
           alignment: Alignment.centerLeft,
           child: customText(
             "Group Events",
             fontWeight: FontWeight.w600,
             fontSize: 18,
           ),
         ),
  
         const SizedBox(height: 16,),
         Container(
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
         const SizedBox(height: 16,),
         Container(
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
       ],
     ),
   ),
  
  
    ],
  ),
)
    );
  }
}
