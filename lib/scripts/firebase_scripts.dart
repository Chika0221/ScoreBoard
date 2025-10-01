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

  Future<void> changeDisplay(int index) async {
    final querySnapshot = await displayCollection.get();
    for (final doc in querySnapshot.docs) {
      if (doc.get("id") == index) {
        await doc.reference.update({"nowDisplay": true});
      } else {
        await doc.reference.update({"nowDisplay": false});
      }
    }
  }
}
