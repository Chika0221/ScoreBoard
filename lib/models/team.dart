// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// build_runnerで生成されるファイル
part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required int id,
    required String name,
    required int point,
  }) = _Team;

  // JSON変換のファクトリコンストラクタ
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
