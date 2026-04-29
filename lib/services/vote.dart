import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_app/model/vote.dart';

class VoteServices {

  String voteCollection = "VoteCollection";

  Future createQuestion(VoteModel model) async {
    DocumentReference docRef =
    FirebaseFirestore.instance.collection(voteCollection).doc();

    return await docRef.set({
      ...model.toJson(docRef.id),
      "createdAt": FieldValue.serverTimestamp(), // ✅ HERE
    });
  }


  /// get all 
   Stream<List<VoteModel>> getQuestions() {
    return FirebaseFirestore.instance
        .collection(voteCollection)
    .orderBy("createdAt", descending: true)
        .snapshots()
        .map(
          (list) =>
          list.docs
              .map((voteJson) => VoteModel.fromJson(voteJson.data()))
              .toList(),
    );
  }

  // add to vote a
  Future addToVoteA(
      {required String voteID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(voteCollection)
        .doc(voteID)
        .update(
        {
          "voteA": FieldValue.arrayUnion([userID]),
        "countA": FieldValue.increment(1)
        });
  }

// remove from vote A
  Future removeFromVoteA(
      {required String voteID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(voteCollection)
        .doc(voteID)
        .update(
        {
          "voteA": FieldValue.arrayRemove([userID]),
        "countA": FieldValue.increment(-1)
});
  }

  // add to vote b
  Future addToVoteB(
      {required String voteID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(voteCollection)
        .doc(voteID)
        .update({
      "voteB": FieldValue.arrayUnion([userID]),
      "countB": FieldValue.increment(1)
    });
  }

// remove from vote b
  Future removeFromVoteB(
      {required String voteID, required String userID}) async {
    return await FirebaseFirestore.instance
        .collection(voteCollection)
        .doc(voteID)
        .update({
      "voteB": FieldValue.arrayRemove([userID]),
      "countB": FieldValue.increment(-1)
    });
  }
}
