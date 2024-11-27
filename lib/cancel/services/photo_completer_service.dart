import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_flutter/cancel/exceptions/fetch_cancelled_exception.dart';
import 'package:sample_flutter/cancel/exceptions/network_exception.dart';
import 'package:sample_flutter/cancel/models/photo.dart';
import 'package:sample_flutter/cancel/repositories/photo_repository.dart';

class PhotoCompleterService {
  final PhotoRepository _photoRepository;

  PhotoCompleterService({required PhotoRepository photoRepository})
      : _photoRepository = photoRepository;

  Stream<Photo> fetchPhotosAsStreamWithCompleter(List<int> ids, Completer<void> completer) {
    final controller = StreamController<Photo>();
    StreamSubscription<Photo>? subscription;

    void startFetching() async {
      try {
        for (var id in ids) {
          if (completer.isCompleted) {
            controller.addError(FetchCancelledException('Fetching photos was cancelled.'));
            break;
          }

          try {
            debugPrint('Fetching photo with id: $id');
            final photoStream = _photoRepository.getPhotoById(id);
            subscription = photoStream.listen((photo) {
              if (completer.isCompleted) {
                controller.addError(FetchCancelledException('Fetching photos was cancelled.'));
                return;
              }
              debugPrint('Fetched photo: ${photo.title}');
              controller.add(photo);
            }, onError: (error) {
              if (error is FetchCancelledException || error is NetworkException) {
                controller.addError(error);
              } else {
                controller.addError(Exception('An unexpected error occurred while fetching photo with id $id.'));
              }
            });

            await subscription!.asFuture();
          } catch (e) {
            if (e is FetchCancelledException || e is NetworkException) {
              controller.addError(e);
              break;
            } else {
              controller.addError(Exception('An unexpected error occurred while fetching photo with id $id.'));
              break;
            }
          }
        }
        await controller.close();
      } catch (e) {
        controller.addError(e);
      }
    }

    startFetching();

    completer.future.then((_) {
      controller.addError(FetchCancelledException('Fetching photos was cancelled.'));
      controller.close();
      subscription?.cancel();
    });

    return controller.stream;
  }

  void cancelFetchingWithCompleter(Completer<void> completer) {
    completer.complete();
  }
}
