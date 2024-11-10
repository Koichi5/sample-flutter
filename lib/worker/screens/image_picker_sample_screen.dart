import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sample_flutter/worker/providers/image_compress_provider.dart';

class ImagePickerSampleScreen extends HookConsumerWidget {
  const ImagePickerSampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compressedImageFileList = useState<List<Uint8List>>([]);
    final isLoading = useState(false);
    final pageController = usePageController();
    final currentPage = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Sample'),
      ),
      body: Center(
        child: Column(
          children: [
            if (compressedImageFileList.value.isNotEmpty)
              Expanded(
                child: Stack(
                  children: [
                    PhotoViewGallery.builder(
                      key: ValueKey(compressedImageFileList.value.length),
                      pageController: pageController,
                      itemCount: compressedImageFileList.value.length,
                      builder: (context, index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: MemoryImage(
                            compressedImageFileList.value[index],
                          ),
                        );
                      },
                      scrollPhysics: const BouncingScrollPhysics(),
                      backgroundDecoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                      ),
                      enableRotation: true,
                      onPageChanged: (index) {
                        currentPage.value = index;
                      },
                      loadingBuilder: (context, event) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    if (currentPage.value > 0)
                      Positioned(
                        left: 10,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: currentPage.value > 0
                                ? () {
                                    pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                : null,
                          ),
                        ),
                      ),
                    if (currentPage.value <
                        compressedImageFileList.value.length - 1)
                      Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: currentPage.value <
                                    compressedImageFileList.value.length - 1
                                ? () {
                                    pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                : null,
                          ),
                        ),
                      ),
                    if (compressedImageFileList.value.length > 1)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${currentPage.value + 1} / ${compressedImageFileList.value.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                isLoading.value = true;
                final List<Uint8List>? pickedImageFileList =
                    await ImagePickerWeb.getMultiImagesAsBytes();
                if (pickedImageFileList == null) {
                  isLoading.value = false;
                  return;
                }

                final List<Future<Uint8List>> compressionFutures =
                    pickedImageFileList.map((imageFile) {
                  return ref.read(imageCompressProvider(imageFile).future);
                }).toList();

                try {
                  final List<Uint8List> compressedImages =
                      await Future.wait(compressionFutures);
                  compressedImageFileList.value = [
                    ...compressedImageFileList.value,
                    ...compressedImages
                  ];
                  if (compressedImages.isNotEmpty) {
                    currentPage.value =
                        compressedImageFileList.value.length - 1;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (pageController.hasClients) {
                        pageController.jumpToPage(currentPage.value);
                      }
                    });
                  }
                } catch (e) {
                  debugPrint('Image compression error: $e');
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('画像の圧縮中にエラーが発生しました: $e'),
                    ),
                  );
                } finally {
                  isLoading.value = false;
                }
              },
              child: isLoading.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      '画像選択',
                    ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
