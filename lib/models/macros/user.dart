import 'dart:convert';
import 'package:sample_flutter/models/macros/model.dart';

@Model()
class User {
  User({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}

@Model()
class GetUsersResponse {
  GetUsersResponse({
    required this.users,
    required this.pageNumber,
    required this.pageSize,
  });

  final List<User> users;
  final int pageNumber;
  final int pageSize;
}
