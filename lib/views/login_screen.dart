
import 'package:event_management_app/views/utils/appbutton.dart';
import 'package:event_management_app/widgets/resuble_widgets.dart' hide customText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'botton_nav.dart';
import 'create_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    customText(
                      "Login",
                     fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,

                    ),
                    customText(
                      " To Your Account",
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: blackColor,

                    ),
                  ],
                ),
                    const SizedBox(height: 4),
                    Text(
                      "Enter given detail to login to your\naccount",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff505050),
                      ),
                    ),

               const SizedBox(height: 82),
                    customText(
                      "Phone number",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,

                    ),

                const SizedBox(height: 6),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Example123@gmail.com",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                    ),
                    filled: true,
                    // Important: tells TextField to use a background color
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                customText(
                  "password",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,

                ),

                const SizedBox(height: 6),


                TextField(
                  obscureText: _obscureText, // Hide/show password
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Toggle password visibility
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14,),
                    TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1E1E1E),
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),

                const SizedBox(height: 33),
                AppButton(txt: "Login", width: 392, height: 56, onPress: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));}),
              const  SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: customText(
                    "OR",
                    fontSize: 16, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 30),
               customButton2(
                   color: Colors.white,
                   borderColor: Color(0xff9A9A9A),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Image.asset("assets/google.png",height: 36,width: 36),
                   customText("Continue with google", fontWeight: FontWeight.w500,fontSize: 14, color: Color(0xff505050))
                 ],
               )),
                SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      "If you don’t have an account ",

                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccount(),
                          ),
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
