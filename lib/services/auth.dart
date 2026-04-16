import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{


  /// sign up
  Future<User> signUp({
    required String email,
    required String password,
  }) async{
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!;

  }
  /// sign in
  Future<User> signIn({
    required String email,
    required String password,
  })async{
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!;
  }
  /// log out
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
  /// forget password
  Future forgetPassword(String email) async{
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  }
}