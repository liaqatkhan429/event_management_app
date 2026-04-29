import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/event.dart';

class EventServices {

  String eventCollection = "EventCollection";

  /// create event
  Future createEvent(EventModel model) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(eventCollection)
        .doc();
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(docRef.id)
        .set(model.toJson(docRef.id));
  }


  /// get events
   Stream<List<EventModel>> getEvents() {
    return FirebaseFirestore.instance
        .collection(eventCollection)
    .orderBy("dateTime", descending: true)
        .snapshots()
        .map(
          (list) =>
          list.docs
              .map((eventJson) => EventModel.fromJson(eventJson.data()))
              .toList(),
    );
  }

  //// get todays events
  Stream<List<EventModel>> getTodaysEvents() {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    return FirebaseFirestore.instance
        .collection(eventCollection)
        .where(
      "dateTime",
      isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay),
    )
        .where(
      "dateTime",
      isLessThan: Timestamp.fromDate(endOfDay),
    )
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }


  // add to favorite
  Future addToFavorite(
      {required String eventID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(eventID)
        .update({"favorite": FieldValue.arrayUnion([userID])});
  }

// remove from favorite
  Future removeFromFavorite(
      {required String eventID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(eventID)
        .update({"favorite": FieldValue.arrayRemove([userID])});
  }


  // get favorite Events
  Stream<List<EventModel>> getFavoriteEvents(String userID) {
    return FirebaseFirestore.instance
        .collection(eventCollection)
        .where("favorite", arrayContains: userID)
        .snapshots()
        .map((list) =>
        list.docs
            .map((eventList) => EventModel.fromJson(eventList.data()))
            .toList());
  }
}