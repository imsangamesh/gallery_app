import 'package:flutter/material.dart';
import 'package:gallery_app/data.dart';
import 'package:gallery_app/my_photo.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index) => PhotoTile(index),
          itemCount: images.length,
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
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyPhoto(index)),
      ),
      child: Image.network(
        images[index],
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes == null
                    ? null
                    : loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!,
              ),
            ),
          );
        },
      ),
    );
  }
}
