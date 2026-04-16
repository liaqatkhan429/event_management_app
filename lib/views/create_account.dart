import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/user.dart';
import '../services/auth.dart';
import '../services/user.dart';
import '../widgets/resuble_widgets.dart';
import 'login_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool isLoading = false;

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
            child: ListView(

              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    customText(
                      "Create",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,

                    ),
                    customText(
                      "Account",
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    "Gmail",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,

                  ),
                ),

                const SizedBox(height: 6),
                TextField(
                  controller: emailController,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    "Password",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,

                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword, // Hide/show password
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
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                          !_obscurePassword; // Toggle password visibility
                        });
                      },
                    ),
                  ),
                ),


                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    "Confirm Password",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,

                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: _obscureConfirmPassword, // Hide/show password
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword =
                          !_obscureConfirmPassword; // Toggle password visibility
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14,),

               InkWell(
                  onTap: () async{
                    if(emailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty){
                      showSnackBar(context, "Fill all fields");
                      return ;
                    }
                    if(confirmPasswordController.text != passwordController.text){
                      showSnackBar(context, "Password is not matching");
                      return;
                    }

                    try{
                      isLoading = true;
                      setState(() {});
                      await AuthServices().signUp(
                          email: emailController.text,
                          password: passwordController.text
                      ).then((val) {
                        UserServices().createUser(
                            UserModel(
                              docId: val.uid,
                              email: emailController.text,

                            )
                        ).then((val){
                          isLoading = false;
                          setState(() {});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        });
                      });
                    }
                    catch(e){
                      isLoading = false;
                      setState(() {});
                      showSnackBar(context, e.toString());
                    }
                  },
                  child: customButton2(
                   width: 392,
                   height: 56,
                   child: isLoading
                       ? CircularProgressIndicator(
                     color: Colors.white,
                     strokeWidth: 0.8,
                   )
                       : customText("Continue", color: Colors.white)
                  ),
                ),
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
                        customText("Continue with google", fontWeight: FontWeight.w500,fontSize: 14, color: Color(0xff505050),
                        )
                      ],
                    )),
                SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      "If you have an account",

                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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