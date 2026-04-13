import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/resuble_widgets.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child: Column(
  
    children: [
      Stack(
        children: [
          Image.asset("assets/event.png"),
          Positioned(
            top: 60,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/backarrow.png",color: Colors.white,width: 20,height: 18,)),
               const SizedBox(width: 260,),
  
                Image.asset("assets/fivorite.png",color: Colors.white,width: 20,height: 18,)
              ],
            ),
          ),
  
        ],
      ),
      const SizedBox(height: 24,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(height: 24),
            customText("Events details",fontWeight: FontWeight.w700,fontSize: 16, ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan quam posuere. Tortor pretium lorem dui metus amet in sed. Sodales volutpat maecenas et quisque nibh ultrices in nulla. Enim fames quam turpis pellentesque vivamus massa.Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan quam posuere. Tortor pretium lorem dui metus amet in sed. Sodales volutpat maecenas et quisque nibh ultrices in nulla. Enim fames quam turpis pellentesque vivamus massa.Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan ",
                  style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 40,),
            customButton(text: 'Add to my calendar'),
            const SizedBox(height: 20,),
  
  
          ],
        ),
      )
    ],
  ),
),
    );
  }
}
