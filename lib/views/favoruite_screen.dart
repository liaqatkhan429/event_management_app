import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/resuble_widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 62,),
                  customText(
                    "Features",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),

              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i){
                      return Column(
                        children: [
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
