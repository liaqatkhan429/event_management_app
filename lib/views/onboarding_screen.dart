// import 'package:event_management_app/views/login_view.dart';
// import 'package:event_management_app/widgets/resuble_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../model/onboarding.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   PageController controller = PageController();
//
//   int currentIndex = 0;
//
//   List<Onboarding> onboardingList = [
//     Onboarding(image: "assets/onboarding1.png", txt1: "Discover What’s\nHappening Nearby", txt2: "Find real events from verified community groups\nand clubs — all in one place."),
//     Onboarding(image: "assets/onboarding2.png", txt1: "Events Sync\nAutomatically", txt2: "No manual setup — we integrate directly with\ngroup calendars for real-time updates."),
//     Onboarding(image: "assets/onboarding3.png", txt1: "Shape the Next\nBig Event", txt2: "Vote on new event ideas, favorite your picks, and\nnever miss what matters most."),
//     ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: PageView.builder(
//                 controller: controller,
//                 itemCount: onboardingList.length,
//                 onPageChanged: (index){
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//                 itemBuilder: (context, index){
//                   return Column(
//                     children: [
//                       Image.asset(onboardingList[index].image.toString()),
//                       customText(
//                         onboardingList[index].txt1.toString(),
//                         fontWeight: FontWeight.w700,
//                         fontSize: 32,
//                         spacing: -1
//                       ),
//                       const SizedBox(height: 6),
//                       customText(
//                           onboardingList[index].txt2.toString(),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14,
//                           color: textColor1
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//
//           const SizedBox(height: 179),
//           SmoothPageIndicator(
//               controller: controller,
//               count: onboardingList.length,
//               effect: ScrollingDotsEffect(
//                 spacing: 6,
//                 dotHeight: 14,
//                 dotWidth: 14,
//                 dotColor: Color(0xffE6E6E6),
//                 activeDotColor: Color(0xffCF3232)
//               )),
//           const SizedBox(height: 24),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: InkWell(
//               onTap: (){
//                 if (currentIndex == onboardingList.length - 1) {
//                   //  Last page → Navigate
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const LoginView(),
//                     ),
//                   );
//                 } else {
//                   //  Next page
//                   controller.nextPage(
//                     duration: const Duration(milliseconds: 500),
//                     curve: Curves.easeInOut,
//                   );
//                 }
//               },
//               child: customButton(
//                   text:
//                   currentIndex == onboardingList.length - 1 ? "Get Started" :
//                   "Next",
//
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
