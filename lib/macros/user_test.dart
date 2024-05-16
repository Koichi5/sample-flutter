import 'dart:convert';

import 'package:sample_flutter/macros/model/user.dart';

void main() {
  const body = '''
    {
      "users": [
        {
          "username": "ramon",
          "password": "12345678"
        }
      ],
      "pageNumber": 1,
      "pageSize": 30
    }
  ''';

  final json = jsonDecode(body) as Map<String, dynamic>;
  final response = GetUsersResponse.fromJson(json);
  final ramon = response.users.first;
  final millsteed = ramon.copyWith(username: 'millsteed', password: '87654321');
  final newResponse = response.copyWith(users: [...response.users, millsteed]);
  print(const JsonEncoder.withIndent('  ').convert(newResponse));
  print('ramon.username: ${ramon.username}');
  print('ramon.password: ${ramon.password}');
  print('newResponse.users.last.username: ${newResponse.users.last.username}');
  print('newResponse.users.last.password: ${newResponse.users.last.password}');
  // $ dart --enable-experiment=macros lib/models/macros/test.dart
  // {
  //   "users": [
  //     {
  //       "username": "ramon",
  //       "password": "12345678"
  //     },
  //     {
  //       "username": "millsteed",
  //       "password": "87654321"
  //     }
  //   ],
  //   "pageNumber": 1,
  //   "pageSize": 30
  // }
}
