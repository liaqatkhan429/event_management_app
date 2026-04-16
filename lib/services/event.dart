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
        .snapshots()
        .map(
          (list) =>
          list.docs
              .map((eventJson) => EventModel.fromJson(eventJson.data()))
              .toList(),
    );
  }
}