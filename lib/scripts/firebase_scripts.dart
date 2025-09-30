// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreScripts {
  final displayCollection = FirebaseFirestore.instance.collection("display");

  Future<void> addPoint(String teamId, int point) async {
    await displayCollection
        .doc("rank")
        .collection("teams")
        .doc("team$teamId")
        .update({"point": FieldValue.increment(point)});
  }
}
