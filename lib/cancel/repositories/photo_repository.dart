import 'package:sample_flutter/cancel/models/photo.dart';

abstract class PhotoRepository {
  Stream<Photo> getPhotoById(int id);
}
