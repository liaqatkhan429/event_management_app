import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Color color =  Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Color(0xFF555555);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color,
        ),

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 13,
              height: 1.5,
            ),
            children: [

              TextSpan(
                text: "Effective Date: April 28, 2026\n\n",
                style: GoogleFonts.poppins(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),

              TextSpan(
                text:
                "This Privacy Policy explains how Event Management App collects and uses your information. By using the app, you agree to this policy.\n\n",
              ),

              TextSpan(
                text: "1. Information We Collect\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "We may collect:\n• Name\n• Email\n• Password\n• Profile picture\n\n",
              ),

              TextSpan(
                text: "2. How We Use Data\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "We use data to run the app, improve experience, send event updates, and ensure security.\n\n",
              ),

              TextSpan(
                text: "3. Notifications\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "We may send event alerts and reminders. You can disable notifications anytime from settings.\n\n",
              ),

              TextSpan(
                text: "4. Data Sharing\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "We do not sell data. We may share limited data with trusted services like Firebase for app functionality.\n\n",
              ),

           TextSpan(
                text: "5. Your Rights\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "You can request access, correction, or deletion of your personal data.\n\n",
              ),

              TextSpan(
                text: "6. Changes\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),

              const TextSpan(
                text:
                "We may update this policy anytime. Continued use means acceptance of changes.\n\n",
              ),

            ],
          )
        ),
      ),
    );
  }
}