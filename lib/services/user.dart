import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class UserServices{
  String userCollection  = "UserCollection";

  /// create user
  Future createUser (UserModel model) async{
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .set(model.toJson());
  }

  ///  update user
  Future updateUser(UserModel model) async{
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .update({
      "userName": model.userName,
      "profileImage": model.profileImage,
    });
  }


  //// merge data

  Future mergeData(UserModel model) async {
    return FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .set(model.toJson(), SetOptions(merge: true));
  }





  /// Save profile image URL
  Future saveProfileImageUrl(String userId, String imageUrl) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userId)
        .update({
      "profileImage": imageUrl,
    });
  }
  

  /// get user profile
  Future getUserProfile(String userId) async{
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userId)
        .get()
        .then((val){
      return UserModel.fromJson(val.data()!);
    });
  }


}