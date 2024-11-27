import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_flutter/cancel/exceptions/fetch_cancelled_exception.dart';
import 'package:sample_flutter/cancel/exceptions/network_exception.dart';
import 'package:sample_flutter/cancel/models/photo.dart';
import 'package:sample_flutter/cancel/services/photo_completer_service.dart';

class PhotoCompleterScreen extends HookWidget {
  const PhotoCompleterScreen({
    super.key,
    required this.photoService,
  });

  final PhotoCompleterService photoService;

  @override
  Widget build(BuildContext context) {
    final isFetching = useState<bool>(false);
    final photos = useState<List<Photo>>([]);
    final subscription = useRef<StreamSubscription<Photo>?>(null);
    final completer = useRef<Completer<void>?>(null);

    void startFetchingPhotos() {
      isFetching.value = true;
      photos.value = [];

      List<int> photoIds = List.generate(100, (index) => index + 1);
      completer.value = Completer<void>();

      Stream<Photo> photoStream = photoService.fetchPhotosAsStreamWithCompleter(
          photoIds, completer.value!);

      subscription.value = photoStream.listen(
        (photo) {
          photos.value = [...photos.value, photo];
        },
        onError: (e) {
          if (e is FetchCancelledException) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('写真取得がキャンセルされました。'),
                ),
              );
            }
          } else if (e is NetworkException) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ネットワークエラーが発生しました。'),
                ),
              );
            }
          } else {
            debugPrint('An error occurred: $e');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('予期せぬエラーが発生しました。'),
                ),
              );
            }
          }
          isFetching.value = false;
        },
        onDone: () {
          isFetching.value = false;
        },
      );
    }

    void cancelFetching() {
      if (isFetching.value) {
        photoService.cancelFetchingWithCompleter(completer.value!);
        isFetching.value = false;
      }
    }

    useEffect(() {
      return () {
        cancelFetching();

        subscription.value?.cancel();
        subscription.value = null;
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('画像取得'),
      ),
      body: Column(
        children: [
          isFetching.value
              ? ElevatedButton(
                  onPressed: cancelFetching,
                  child: const Text('キャンセル'),
                )
              : ElevatedButton(
                  onPressed: startFetchingPhotos,
                  child: const Text('写真を取得'),
                ),
          Expanded(
            child: ListView.builder(
              itemCount: photos.value.length,
              itemBuilder: (context, index) {
                final photo = photos.value[index];
                return ListTile(
                  leading: Image.network(
                    photo.thumbnailUrl,
                    height: 100,
                    width: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(
                          Icons.error,
                          color: Colors.yellow,
                        ),
                      );
                    },
                  ),
                  title: Text(photo.title),
                  contentPadding: const EdgeInsets.all(8),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
