import 'package:event_management_app/widgets/reuseble_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color =  Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Color(0xFF555555);
    return Scaffold(
      appBar: AppBar(
        title:  customText("Terms & Conditions", fontSize: 18, fontWeight: FontWeight.w600,color: color),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child:RichText(
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
                "These Terms govern your use of the Event Management App. By using the app, you agree to these conditions.\n\n",
              ),

              TextSpan(
                text: "1. Use\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "Use the app only for lawful purposes. Do not misuse or damage its functionality.\n\n",
              ),

              TextSpan(
                text: "2. User Responsibilities\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "Provide correct information, avoid illegal content, and follow all applicable laws.\n\n",
              ),

              TextSpan(
                text: "3. Event Info\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "We try to keep event details accurate but do not guarantee 100% correctness. Verify before attending.\n\n",
              ),

              TextSpan(
                text: "4. Notifications\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "You may receive event updates. Notifications can be turned off anytime.\n\n",
              ),

              TextSpan(
                text: "5. Liability\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "We are not responsible for losses, cancellations, or incorrect event data.\n\n",
              ),

              TextSpan(
                text: "6. Account Control\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "We may suspend accounts if rules are violated or misuse is detected.\n\n",
              ),

              TextSpan(
                text: "7. Changes\n",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text:
                "Terms may change anytime. Continued use means acceptance of updates.\n\n",
              ),

            ],
          ),
        )
      ),
    );
  }
}