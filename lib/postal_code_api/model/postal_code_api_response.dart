import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_flutter/postal_code_api/model/address.dart';

part 'postal_code_api_response.freezed.dart';
part 'postal_code_api_response.g.dart';

@freezed
abstract class PostalCodeApiResponse with _$PostalCodeApiResponse {
    const factory PostalCodeApiResponse({
      required String postalCode,
      required List<Address>? addresses,
    }) = _PostalCodeApiResponse;

    const PostalCodeApiResponse._();

    factory PostalCodeApiResponse.fromJson(Map<String, dynamic> json) => _$PostalCodeApiResponseFromJson(json);
}
