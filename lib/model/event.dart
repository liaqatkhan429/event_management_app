// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);



import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String? docId;
  final String? title;
  final Timestamp? dateTime;
  final String? location;
  final String? eventDetails;
  final String? image;
  final List<String>? favorite;
  final int? createAt;

  EventModel({
    this.docId,
    this.title,
    this.dateTime,
    this.location,
    this.eventDetails,
    this.image,
    this.favorite,
    this.createAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    docId: json["docId"],
    title: json["title"],
    dateTime: json["dateTime"],
    location: json["location"],
    eventDetails: json["eventDetails"],
    image: json["image"],
    favorite: json["favorite"] == null ? [] : List<String>.from(json["favorite"]!.map((x) => x)),
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson(String eventId) => {
    "docId": eventId,
    "title": title,
    "dateTime": dateTime,
    "location": location,
    "eventDetails": eventDetails,
    "image": image,
    "favorite": favorite == null ? [] : List<dynamic>.from(favorite!.map((x) => x)),
    "createAt": createAt,
  };
}
