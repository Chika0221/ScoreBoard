// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/models/team.dart';

final displayStreamProvider = StreamProvider.autoDispose<List<Display>>((ref) {
  final collection = FirebaseFirestore.instance.collection("display");

  final stream = collection.snapshots().map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
        final teamsCollection = doc.reference.collection("teams");
        final teamsSnapshots = teamsCollection.snapshots();
        final teams = teamsSnapshots.map((snapshot) {
          return snapshot.docs
              .map((teamDoc) => Team.fromJson(teamDoc.data()))
              .toList()
            ..sort((a, b) => b.point.compareTo(a.point));
        });

        return Display.fromJson(doc.data()).copyWith(teams: teams);
      }).toList()
      ..sort((a, b) => a.id);
  });

  return stream;
});
