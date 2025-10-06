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
      type: $enumDecode(_$DisplayTypeEnumMap, json['type']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DisplayImplToJson(_$DisplayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nowDisplay': instance.nowDisplay,
      'title': instance.title,
      'type': _$DisplayTypeEnumMap[instance.type]!,
      'description': instance.description,
    };

const _$DisplayTypeEnumMap = {
  DisplayType.rank: 'rank',
  DisplayType.slideString: 'slideString',
  DisplayType.slideImage: 'slideImage',
};
