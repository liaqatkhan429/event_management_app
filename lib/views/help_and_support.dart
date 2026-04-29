import 'package:event_management_app/widgets/reuseble_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  customText("Help & Support", fontSize: 18, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Color(0xFF555555)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

                   /// Intro
            Text(
              "If you have any questions or need assistance while using the app, please review the information below or contact our support team.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 13,
                height: 1.6,
              ),

            ),

            const SizedBox(height: 20),

            /// FAQ Section
            Text(
              "Frequently Asked Questions",
              style: GoogleFonts.poppins(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            _faqItem(
              "How can I add an event to the calendar?",
              "You can add an event by tapping the 'Add to My Calendar' button on any event. The selected event date will then appear on your calendar.",
            ),

            _faqItem(
              "How can I apply filters to events?",
              "You can apply filters by tapping the filter icon on the top right, selecting your preferred city, state, or category, and then pressing 'Apply Filter' to see the filtered results.",
            ),

            _faqItem(
              "How can I update my profile?",
              "You can update your profile by going to the profile section, editing your details, and saving the changes.",
            ),

            const SizedBox(height: 20),

            /// Contact Section
            Text(
              "Contact Us",
              style: GoogleFonts.poppins(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "If you still need help, feel free to contact us:",
              style: GoogleFonts.poppins(fontSize: 13),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Text(
                  "📧  ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "liaqat@gmail.com",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

           customButton(text: "Contact Support")
          ],
        ),
      ),
    );
  }

  /// FAQ Widget
  Widget _faqItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            answer,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 13,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}