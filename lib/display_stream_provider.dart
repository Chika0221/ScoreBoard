// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/models/team.dart';

final displayStreamProvider = StreamProvider.autoDispose<List<Display>>((ref) {
  final collection = FirebaseFirestore.instance.collection("display");

  final stream = collection.snapshots().asyncMap((querySnapshot) async {
    return Future.wait(
      querySnapshot.docs.map((doc) async {
        final teamsCollection = doc.reference.collection("teams");
        final teamsSnapshot = await teamsCollection.get();
        final teams =
            teamsSnapshot.docs
                .map((teamDoc) => Team.fromJson(teamDoc.data()))
                .toList();

        return Display.fromJson(doc.data()).copyWith(teams: teams);
      }).toList(),
    );
  });

  return stream;
});
