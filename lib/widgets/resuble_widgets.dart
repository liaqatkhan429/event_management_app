import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color buttonColor = Color(0xFFCF3232);
const Color textColor1 = Color(0xFF727272);
const Color blackColor = Color(0xFF1F1F1F);

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
  Color borderColor = Colors.transparent,


}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor)
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


//// custom button
Widget customButton2({

  double radius = 8,
  double height = 56,
  double width = double.infinity,
  Color color = buttonColor,
  Color borderColor = Colors.transparent,
  VoidCallback? onPressed,
  required Widget child,

}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
          color: borderColor,
        width: 0.6,

      )
    ),
    child: Center(
      child: child,
    ),
  );
}
