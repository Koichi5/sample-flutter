import 'package:sample_flutter/cancel/data_sources/remote_photo_data_source.dart';
import 'package:sample_flutter/cancel/exceptions/fetch_cancelled_exception.dart';
import 'package:sample_flutter/cancel/exceptions/network_exception.dart';
import 'package:sample_flutter/cancel/models/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final RemotePhotoDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<Photo> getPhotoById(int id) async* {
    try {
      yield* remoteDataSource.getPhotoByIdStream(id);
    } catch (e) {
      if (e is FetchCancelledException) {
        rethrow;
      } else if (e is NetworkException) {
        rethrow;
      } else {
        throw Exception('Failed to fetch photo with id $id.');
      }
    }
  }
}