// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:m_score_board/models/team.dart';

// build_runnerで生成されるファイル
part 'display.freezed.dart';
part 'display.g.dart';

@freezed
class Display with _$Display {
  const factory Display({
    required int id,
    required bool nowDisplay,
    required String title,
    String? description,
    List<Team>? teams,
  }) = _Display;

  // JSON変換のファクトリコンストラクタ
  factory Display.fromJson(Map<String, dynamic> json) =>
      _$DisplayFromJson(json);
}
