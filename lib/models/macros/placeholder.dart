import 'package:sample_flutter/models/macros/model.dart';

@Model()
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}

// @Model()
// class Photo (int albumId, int id, String title, String url, String thumbnailUrl);

@Model()
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

// @Model()
// class Post (int userId, int id, String title, String body);

@Model()
class Hoge {
  final int id;
  final Post post;
}
