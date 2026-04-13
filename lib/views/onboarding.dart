
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/resuble_widgets.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Discover What’s\nHappening Nearby',
      'description':
      'Find real events from verified community groups\nand clubs — all in one place.',
      'image': 'assets/pageview1.png',
    },
    {
      'title': 'Events Sync\nAutomatically',
      'description':
      'No manual setup — we integrate directly with group calendars for real-time updates.',
      'image': 'assets/pageview2.png',
    },
    {
      'title': 'Shape the Next\nBig Event',
      'description':
      'Vote on new event ideas, favorite your picks, and never miss what matters most.',
      'image': 'assets/pageview3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroup.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (currentIndex < onboardingData.length - 1)
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            onboardingData.length - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xffC85C5C),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Expanded(
                            flex: 5,
                            child: Image.asset(
                              onboardingData[index]['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 30),

                      customText(
                     onboardingData[index]['title']!,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        spacing: -1
                      ),
                          const SizedBox(height: 16),

                      customText(
                          onboardingData[index]['description']!,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.8,
                          color: textColor1
                      ),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                SmoothPageIndicator(
              controller:_pageController,
              count: onboardingData.length,
              effect: ScrollingDotsEffect(
                spacing: 6,
                dotHeight: 14,
                dotWidth: 14,
                dotColor: Color(0xffE6E6E6),
                activeDotColor: Color(0xffCF3232)
              )),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffB33939),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            if (currentIndex < onboardingData.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            currentIndex == onboardingData.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    );
  }
}