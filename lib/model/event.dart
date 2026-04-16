// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

class EventModel {
  final String? docId;
  final String? title;
  final String? date;
  final String? time;
  final String? location;
  final String? eventDetails;
  final String? image;
  final int? createAt;

  EventModel({
    this.docId,
    this.title,
    this.date,
    this.time,
    this.location,
    this.eventDetails,
    this.image,
    this.createAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    docId: json["docId"],
    title: json["title"],
    date: json["date"],
    time: json["time"],
    location: json["location"],
    eventDetails: json["eventDetails"],
    image: json["image"],
    createAt: json["createAt"],
  );

  Map<String, dynamic> toJson(String eventId) => {
    "docId": eventId,
    "title": title,
    "date": date,
    "time": time,
    "location": location,
    "eventDetails": eventDetails,
    "image": image,
    "createAt": createAt,
  };
}
