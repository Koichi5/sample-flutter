// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      prefectureCode: json['prefectureCode'] as String?,
      ja: json['ja'] == null
          ? null
          : En.fromJson(json['ja'] as Map<String, dynamic>),
      kana: json['kana'] == null
          ? null
          : En.fromJson(json['kana'] as Map<String, dynamic>),
      en: json['en'] == null
          ? null
          : En.fromJson(json['en'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'prefectureCode': instance.prefectureCode,
      'ja': instance.ja,
      'kana': instance.kana,
      'en': instance.en,
    };
