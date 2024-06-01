// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_code_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostalCodeApiResponseImpl _$$PostalCodeApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostalCodeApiResponseImpl(
      postalCode: json['postalCode'] as String,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PostalCodeApiResponseImplToJson(
        _$PostalCodeApiResponseImpl instance) =>
    <String, dynamic>{
      'postalCode': instance.postalCode,
      'addresses': instance.addresses,
    };
