import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_flutter/postal_code_api/model/en.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String? prefectureCode,
    required En? ja,
    required En? kana,
    required En? en,
  }) = _Address;

  const Address._();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
