// To parse this JSON data, do
//
//     final voteModel = voteModelFromJson(jsonString);


import 'package:cloud_firestore/cloud_firestore.dart';

class VoteModel {
  final String? docId;
  final String? question;
  final String? optionOne;
  final String? optionTwo;
  final String? image;
  final Timestamp? createdAt;
  final int? countA;
  final int? countB;
  final List<String>? voteA;
  final List<String>? voteB;

  VoteModel({
    this.docId,
    this.question,
    this.optionOne,
    this.optionTwo,
    this.image,
    this.createdAt,
    this.countA,
    this.countB,
    this.voteA,
    this.voteB,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) => VoteModel(
    docId: json["docId"],
    question: json["question"],
    optionOne: json["optionOne"],
    optionTwo: json["optionTwo"],
    image: json["image"],
    createdAt: json["createdAt"],
    countA: json["countA"],
    countB: json["countB"],
    voteA: json["voteA"] == null ? [] : List<String>.from(json["voteA"]!.map((x) => x)),
    voteB: json["voteB"] == null ? [] : List<String>.from(json["voteB"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson(String voteId) => {
    "docId": voteId,
    "question": question,
    "optionOne": optionOne,
    "optionTwo": optionTwo,
    "image": image,
    "createdAt": createdAt,
    "countA": countA,
    "countB": countB,
    "voteA": voteA == null ? [] : List<dynamic>.from(voteA!.map((x) => x)),
    "voteB": voteB == null ? [] : List<dynamic>.from(voteB!.map((x) => x)),
  };
}
