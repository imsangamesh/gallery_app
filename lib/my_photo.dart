import 'package:flutter/material.dart';
import 'package:gallery_app/data.dart';
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
      appBar: AppBar(title: CountTile(myIndex: myIndex)),
      backgroundColor: Colors.transparent,
      body: Center(
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
    return Container(
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
    );
  }
}
