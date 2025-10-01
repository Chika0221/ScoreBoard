// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/models/team.dart';

final displayStreamProvider = StreamProvider.autoDispose<List<Display>>((ref) {
  final collection = FirebaseFirestore.instance.collection("display");

  final stream = collection.snapshots().map((querySnapshot) {
    final displays =
        querySnapshot.docs.map((doc) {
          final teamsCollection = doc.reference.collection("teams");
          final teamsSnapshots = teamsCollection.snapshots();
          final teamsStream = teamsSnapshots.map((snapshot) {
            final teams =
                snapshot.docs
                    .map((teamDoc) => Team.fromJson(teamDoc.data()))
                    .toList();

            teams.sort((a, b) => a.id.compareTo(b.id));

            return teams;
          });

          return Display.fromJson(doc.data()).copyWith(teams: teamsStream);
        }).toList();
    displays.sort((a, b) => a.id.compareTo(b.id));
    return displays;
  });

  return stream;
});
