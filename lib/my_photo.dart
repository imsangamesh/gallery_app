import 'package:flutter/material.dart';
import 'package:gallery_app/data.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MyPhoto extends StatefulWidget {
  MyPhoto(this.indexR, {Key? key})
      : pageController = PageController(initialPage: indexR),
        super(key: key);

  final int indexR;
  final PageController pageController;

  @override
  State<MyPhoto> createState() => _MyPhotoState();
}

class _MyPhotoState extends State<MyPhoto> {
  //
  late int myIndex;

  @override
  void initState() {
    myIndex = widget.indexR;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Hero(
            tag: widget.indexR,
            child: PhotoViewGallery.builder(
              pageController: widget.pageController,
              itemCount: images.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 2,
                );
              },
              onPageChanged: (i) => setState(() => myIndex = i),
            ),
          ),
          Positioned(
            top: 150,
            right: 3,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.pink.withAlpha(100),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          CountTile(myIndex: myIndex),
        ],
      ),
    );
  }
}

class CountTile extends StatelessWidget {
  const CountTile({
    Key? key,
    required this.myIndex,
  }) : super(key: key);

  final int myIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pink.shade100,
        ),
        child: Text(
          '${myIndex + 1} / ${images.length}',
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
