// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? docId;
  final String? userName;
  final String? email;
  final String? password;
  final String? profileImage;

  UserModel({
    this.docId,
    this.userName,
    this.email,
    this.password,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    docId: json["docId"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "userName": userName,
    "email": email,
    "password": password,
    "profileImage": profileImage,
  };
}
