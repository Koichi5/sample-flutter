import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_flutter/postal_code_api/model/postal_code_api_response.dart';
import 'package:http/http.dart' as http;

part 'postal_code_repository.g.dart';

@riverpod
Future<PostalCodeApiResponse> fetchPostalCodeApiResponse(
    FetchPostalCodeApiResponseRef ref, int postalCode) async {
  final url = 'https://jp-postal-code-api.ttskch.com/api/v1/$postalCode.json';
  final response = await http.get(Uri.parse(url));
  final postalCodeApiResponseMap = json.decode(response.body);
  final postalCodeApiResponse =
      PostalCodeApiResponse.fromJson(postalCodeApiResponseMap);
  return postalCodeApiResponse;
}
