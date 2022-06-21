import 'package:flutter/material.dart';
import 'package:gallery_app/data.dart';
import 'package:get/get.dart';

import 'my_photo.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('my Gallery'),
          leading: IconButton(
            icon: const Icon(Icons.fastfood_rounded),
            onPressed: () {},
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return PhotoTile(index);
          },
        ),
      ),
    );
  }
}

class PhotoTile extends StatelessWidget {
  const PhotoTile(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: InkWell(
        splashColor: Colors.pink.withAlpha(20),
        onTap: () => Get.to(() => MyPhoto(index)),
        child: Ink.image(
          image: NetworkImage(images[index]),
        ),
      ),
    );
  }
}
