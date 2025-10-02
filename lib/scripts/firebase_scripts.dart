// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';

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

  Future<void> addDisplay(Display newDisplay) async {
    await displayCollection.doc().set(newDisplay.toJson());
  }

  Future<void> deleteDisplay(Display display) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();

    final docToDeleteQuery =
        await displayCollection.where("id", isEqualTo: display.id).get();
    if (docToDeleteQuery.docs.isNotEmpty) {
      batch.delete(docToDeleteQuery.docs.first.reference);
    }

    final docsToUpdateQuery =
        await displayCollection.where("id", isGreaterThan: display.id).get();

    for (final doc in docsToUpdateQuery.docs) {
      final currentId = doc.data()["id"] as int;
      batch.update(doc.reference, {"id": currentId - 1});
    }

    await batch.commit();
  }

  Future<void> updateDisplay(Display display) async {
    final query =
        await displayCollection.where("id", isEqualTo: display.id).get();
    query.docs.first.reference.update(display.toJson());
  }
}
