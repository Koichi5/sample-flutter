import 'package:freezed_annotation/freezed_annotation.dart';

part 'en.freezed.dart';
part 'en.g.dart';

@freezed
abstract class En with _$En {
  const factory En({
    required String prefecture,
    required String address1,
    required String address2,
    required String address3,
    required String address4,
  }) = _En;

  const En._();

  factory En.fromJson(Map<String, dynamic> json) => _$EnFromJson(json);
}
