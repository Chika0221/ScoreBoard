// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';

class RankNotifier extends AutoDisposeNotifier<List<int>> {
  @override
  List<int> build() {
    final displayStream = ref.watch(displayStreamProvider);

    return displayStream.when(
      data: (data) {
        List<int> rank = List.filled(5, 4);

        final rankDisplay = data.firstWhere((display) => display.id == 0);

        // Listen to the teams stream of the rankDisplay
        rankDisplay.teams!.listen((teamsList) {
          // Sort the teams by point in descending order
          final sortedTeams = List.of(teamsList)
            ..sort((a, b) => b.point.compareTo(a.point));

          // Assign ranks based on the sorted order, handling ties
          for (int i = 0; i < sortedTeams.length; i++) {
            if (i > 0 && sortedTeams[i].point == sortedTeams[i - 1].point) {
              // Same score as the previous team, so same rank
              rank[sortedTeams[i].id] = rank[sortedTeams[i - 1].id];
            } else {
              // Different score, rank is the current position (i + 1)
              rank[sortedTeams[i].id] = i + 1;
            }
          }

          state = rank;
        });

        return rank;
      },
      error: (error, stackTrace) => [],
      loading: () => [],
    );
  }
}

final RankProvider = NotifierProvider.autoDispose<RankNotifier, List<int>>(
  RankNotifier.new,
);
