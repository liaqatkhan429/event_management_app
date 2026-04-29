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
      TextAlign? textAlign = TextAlign.start,
}
) {
  return Text(
    text,
    textAlign: textAlign,
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

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
      ),
      content: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
            fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff838383),width: 0.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff838383),width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff838383),width: 0.4),
        ),
      ),
    );
  }
}


/////// dropdown
class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final Function(String)? onChanged;
  final String? selectedValue;
  const CustomDropdown({super.key, required this.hintText, required this.items,  this.onChanged, this.selectedValue});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 0.4, color: Color(0xff838383)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: customText(
            widget.hintText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),

          items: widget.items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),

          onChanged: (value) {
            setState(() {
              selectedValue = value;
              if (value != null) {
                widget.onChanged?.call(value);
              }
            });
          },
        ),
      ),
    );
  }
}


