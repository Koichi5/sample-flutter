import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// class PhotoViewSample extends StatelessWidget {
//   const PhotoViewSample({super.key});

//   static const imageUrls = [
//     'https://cdn.pixabay.com/photo/2015/05/04/10/16/vegetables-752153_1280.jpg',
//     'https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg',
//     'https://cdn.pixabay.com/photo/2016/08/11/08/04/vegetables-1584999_1280.jpg',
//     'https://cdn.pixabay.com/photo/2015/05/30/01/18/vegetables-790022_1280.jpg',
//     'https://cdn.pixabay.com/photo/2017/06/09/16/39/carrots-2387394_1280.jpg',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Photo View Sample'),
//       ),
//       body: PhotoViewGallery.builder(
//         itemCount: imageUrls.length,
//         builder: (context, index) {
//           return PhotoViewGalleryPageOptions(
//             imageProvider: NetworkImage(
//               imageUrls[index],
//             ),
//             // minScale: PhotoViewComputedScale.contained * 0.8,
//             // maxScale: PhotoViewComputedScale.covered * 2,
//           );
//         },
//         scrollPhysics: const BouncingScrollPhysics(),
//         backgroundDecoration: BoxDecoration(
//           color: Theme.of(context).canvasColor,
//         ),
//         enableRotation: true,
//         loadingBuilder: (context, event) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

class PhotoViewSample extends StatelessWidget {
  PhotoViewSample({Key? key}) : super(key: key);

  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2015/05/04/10/16/vegetables-752153_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/08/11/08/04/vegetables-1584999_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/05/30/01/18/vegetables-790022_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/06/09/16/39/carrots-2387394_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo View Sample'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              openPhotoViewGallery(context, index);
            },
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Future<void> openPhotoViewGallery(
      BuildContext context, int initialIndex) async {
    await showDialog(
      context: context,
      builder: (context) {
        return GalleryScreen(
          imageUrls: imageUrls,
          initialIndex: initialIndex,
        );
      },
    );
  }
}

class GalleryScreen extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const GalleryScreen({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: PhotoViewGallery.builder(
            itemCount: imageUrls.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrls[index]),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 1.1,
              );
            },
            pageController: PageController(initialPage: initialIndex),
            backgroundDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
