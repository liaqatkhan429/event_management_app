
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class AppButton extends StatelessWidget {
  final String txt;
  final double height;
  final double width;
  final VoidCallback? onPress;
  final Color? color;

  const AppButton({
    super.key,
    required this.txt,
    required this.width,
    required this.height,
    required this.onPress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color ?? const Color(0xFFCF3232), // 👈 default
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          txt,
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


const Color buttonColor = Color(0xFFCF3232);
const Color textColor1 = Color(0xFF727272);

/// custom text
Widget customText(
    String text, {
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black,
      TextStyle? style,
      double spacing = 0,
    }
    ) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
    style ??
        GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: spacing,
        ),
  );
}

//// custom button
Widget customButton({
  required String text,
  double height = 56,
  double width = double.infinity,
  Color color = buttonColor,
  VoidCallback? onPressed,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  Color txtColor = Colors.white,
  TextStyle? style,
  double spacing = 0,

}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
        style ??
            GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: txtColor,
              letterSpacing: spacing,
            ),
      ),
    ),
  );
}