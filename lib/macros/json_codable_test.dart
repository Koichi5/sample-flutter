import 'package:sample_flutter/macros/model/json_codable_user.dart';

void main() {
  var userJson = {'age': 5, 'name': 'Roger', 'username': 'roger1337'};
  var user = JsonCodableUser.fromJson(userJson);
  print('user age: ${user.age}');
  print('user name: ${user.name}');
  print('user username: ${user.username}');
  print(user.toJson());
}
