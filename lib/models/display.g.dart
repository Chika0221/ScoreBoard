// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisplayImpl _$$DisplayImplFromJson(Map<String, dynamic> json) =>
    _$DisplayImpl(
      id: (json['id'] as num).toInt(),
      nowDisplay: json['nowDisplay'] as bool,
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DisplayImplToJson(_$DisplayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nowDisplay': instance.nowDisplay,
      'title': instance.title,
      'description': instance.description,
    };
