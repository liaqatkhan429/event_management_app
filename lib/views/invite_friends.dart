import 'package:event_management_app/widgets/reuseble_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  final String inviteCode = "LIAQAT123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText("Invite Friends", fontSize: 18, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Color(0xFF555555))
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const SizedBox(height: 20),

            /// Icon
            Icon(Icons.group, size: 90, color: buttonColor),

            const SizedBox(height: 20),

            /// Title
            Text(
              "Invite Your Friends",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            /// Description
            Text(
              "Share the app with your friends and enjoy discovering amazing events together.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 60),

            /// Share Button
            InkWell(
                onTap: (){
                  SharePlus.instance.share(
                    ShareParams(
                      text: "Join me on this amazing Event App!\nUse my code: $inviteCode\nDownload now",
                    ),
                  );
                },
                child: customButton(text: "Invite Friends")),

          ],
        ),
      ),
    );
  }

}