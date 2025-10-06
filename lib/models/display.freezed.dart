// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Display _$DisplayFromJson(Map<String, dynamic> json) {
  return _Display.fromJson(json);
}

/// @nodoc
mixin _$Display {
  int get id => throw _privateConstructorUsedError;
  bool get nowDisplay => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DisplayType get type => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  Stream<List<Team>>? get teams => throw _privateConstructorUsedError;

  /// Serializes this Display to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Display
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayCopyWith<Display> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayCopyWith<$Res> {
  factory $DisplayCopyWith(Display value, $Res Function(Display) then) =
      _$DisplayCopyWithImpl<$Res, Display>;
  @useResult
  $Res call({
    int id,
    bool nowDisplay,
    String title,
    DisplayType type,
    String? description,
    @JsonKey(ignore: true) Stream<List<Team>>? teams,
  });
}

/// @nodoc
class _$DisplayCopyWithImpl<$Res, $Val extends Display>
    implements $DisplayCopyWith<$Res> {
  _$DisplayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Display
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nowDisplay = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? teams = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            nowDisplay:
                null == nowDisplay
                    ? _value.nowDisplay
                    : nowDisplay // ignore: cast_nullable_to_non_nullable
                        as bool,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as DisplayType,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            teams:
                freezed == teams
                    ? _value.teams
                    : teams // ignore: cast_nullable_to_non_nullable
                        as Stream<List<Team>>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DisplayImplCopyWith<$Res> implements $DisplayCopyWith<$Res> {
  factory _$$DisplayImplCopyWith(
    _$DisplayImpl value,
    $Res Function(_$DisplayImpl) then,
  ) = __$$DisplayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    bool nowDisplay,
    String title,
    DisplayType type,
    String? description,
    @JsonKey(ignore: true) Stream<List<Team>>? teams,
  });
}

/// @nodoc
class __$$DisplayImplCopyWithImpl<$Res>
    extends _$DisplayCopyWithImpl<$Res, _$DisplayImpl>
    implements _$$DisplayImplCopyWith<$Res> {
  __$$DisplayImplCopyWithImpl(
    _$DisplayImpl _value,
    $Res Function(_$DisplayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Display
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nowDisplay = null,
    Object? title = null,
    Object? type = null,
    Object? description = freezed,
    Object? teams = freezed,
  }) {
    return _then(
      _$DisplayImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        nowDisplay:
            null == nowDisplay
                ? _value.nowDisplay
                : nowDisplay // ignore: cast_nullable_to_non_nullable
                    as bool,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as DisplayType,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        teams:
            freezed == teams
                ? _value.teams
                : teams // ignore: cast_nullable_to_non_nullable
                    as Stream<List<Team>>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayImpl implements _Display {
  const _$DisplayImpl({
    required this.id,
    required this.nowDisplay,
    required this.title,
    required this.type,
    this.description,
    @JsonKey(ignore: true) this.teams,
  });

  factory _$DisplayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayImplFromJson(json);

  @override
  final int id;
  @override
  final bool nowDisplay;
  @override
  final String title;
  @override
  final DisplayType type;
  @override
  final String? description;
  // ignore: invalid_annotation_target
  @override
  @JsonKey(ignore: true)
  final Stream<List<Team>>? teams;

  @override
  String toString() {
    return 'Display(id: $id, nowDisplay: $nowDisplay, title: $title, type: $type, description: $description, teams: $teams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nowDisplay, nowDisplay) ||
                other.nowDisplay == nowDisplay) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.teams, teams) || other.teams == teams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nowDisplay, title, type, description, teams);

  /// Create a copy of Display
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayImplCopyWith<_$DisplayImpl> get copyWith =>
      __$$DisplayImplCopyWithImpl<_$DisplayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayImplToJson(this);
  }
}

abstract class _Display implements Display {
  const factory _Display({
    required final int id,
    required final bool nowDisplay,
    required final String title,
    required final DisplayType type,
    final String? description,
    @JsonKey(ignore: true) final Stream<List<Team>>? teams,
  }) = _$DisplayImpl;

  factory _Display.fromJson(Map<String, dynamic> json) = _$DisplayImpl.fromJson;

  @override
  int get id;
  @override
  bool get nowDisplay;
  @override
  String get title;
  @override
  DisplayType get type;
  @override
  String? get description; // ignore: invalid_annotation_target
  @override
  @JsonKey(ignore: true)
  Stream<List<Team>>? get teams;

  /// Create a copy of Display
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayImplCopyWith<_$DisplayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
