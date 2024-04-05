import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_flutter/models/macros/placeholder.dart';

Future main() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    const int limit = 10;
    for (int i = 0; i < limit; i++) {
      final json = jsonList[i];
      final post = Post.fromJson(json as Map<String, dynamic>);
      print('${post.id} --------------------');
      print('title: ${post.title}');
      print('body: ${post.body}');
      print('posted by id: ${post.userId}\n');
    }
  } else {
    print('Get Error');
  }
}

// Future main() async {
//   final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     final jsonList = jsonDecode(response.body) as List<dynamic>;
//     const int limit = 10;
//     for (int i = 0; i < limit; i++) {
//       final json = jsonList[i];
//       final photo = Photo.fromJson(json as Map<String, dynamic>);
//       print('${photo.albumId} ---------------------');
//       print('title: ${photo.title}');
//       print('url: ${photo.url}');
//       print('image url: ${photo.url}\n');
//     }
//   } else {
//     print('Get Error');
//   }
// }
