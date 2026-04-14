


import 'package:event_management_app/views/admin_community_screen.dart';
import 'package:event_management_app/views/community_screen.dart';
import 'package:event_management_app/views/home_screen.dart';
import 'package:event_management_app/views/sitting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features.dart';
import 'favoruite_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> screenList = [
    const HomeScreen(),
    const Features(),
    const AdminCommunityScreen(),
    const FavoritesScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar:Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Color(0xff555555),
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          currentIndex: selectedIndex,

          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },

          items: [
            _buildNavItem(selectedIndex == 0
                ? "assets/homefilled.png"
                : "assets/home.png",
                "Home", 0),

            _buildNavItem(selectedIndex == 1
                ? "assets/featurefilled.png"
                : "assets/star.png", "Features", 1),

            _buildNavItem(selectedIndex == 2
                ? "assets/communityfilled.png"
                : "assets/comm.png",
                "Community", 2),

            _buildNavItem(selectedIndex == 3
                ? "assets/favoritefilled.png"
                : "assets/fivorite.png",
                "Favorite", 3),

            _buildNavItem(selectedIndex == 4
                ? "assets/sittingfilled.png"
                : "assets/setting.png", "Settings", 4),
          ],
        ),
      )
    );
  }

  // Helper method for bottom nav items with color-changing icons
  BottomNavigationBarItem _buildNavItem(String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetPath,
        width: 28,
        height: 28,
        color: selectedIndex == index ? const Color(0xffCF3232) : const Color(0xFF555555),
      ),
      label: label,
    );
  }
}