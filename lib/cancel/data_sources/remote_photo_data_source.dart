import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_flutter/cancel/models/photo.dart';
import 'package:sample_flutter/cancel/exceptions/fetch_cancelled_exception.dart';

class RemotePhotoDataSource {
  final http.Client client;

  RemotePhotoDataSource({required this.client});

  Future<Photo> fetchPhotoById(int id) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'));

    if (response.statusCode == 200) {
      return Photo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load photo');
    }
  }

  Stream<Photo> getPhotoByIdStream(int id) async* {
    try {
      final photo = await fetchPhotoById(id);
      await Future.delayed(const Duration(seconds: 1));
      yield photo;
    } catch (e) {
      if (e is FetchCancelledException) {
        debugPrint(e.toString());
        rethrow;
      } else {
        debugPrint('Error fetching photo ID $id: $e');
        rethrow;
      }
    }
  }
}
