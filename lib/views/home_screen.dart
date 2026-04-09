import 'package:event_management_app/widgets/resuble_widgets.dart';
import 'package:flutter/material.dart';

import 'calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homebg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customText(
                      "Events",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    Image.asset("assets/filter.png"),
                  ],
                ),
                const SizedBox(height: 38),
                Row(
                  children: [
                    customButton(
                      text: "Calender view",
                      height: 44,
                      width: 152,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),

                    const SizedBox(width: 92),
                    customText("List view"),
                  ],
                ),
                const SizedBox(height: 22),
                Expanded(flex: 2, child: CustomCalendar()),

                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: BoxBorder.all(
                            color: Color(0xffCFCFCF),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/user.png"),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      customText(
                                        "Tech Meetup",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                      customText(
                                        "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff7A7A7A),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Icon(Icons.favorite_outline_rounded),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xffCF3232),
                                  ),
                                  const SizedBox(width: 8),
                                  customText(
                                    "2464 Royal Ln. Mesa, New Jersey 45463",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff3C3C3C),
                                  ),
                                ],
                              ),
                               const SizedBox(height: 8),
                              customButton(text: "Add to my calendar",fontSize: 14, fontWeight: FontWeight.w500, height: 42,width: 172)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
