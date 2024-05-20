import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ImageExample extends StatefulWidget {
  const ImageExample({super.key});

  @override
  State<ImageExample> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Image Example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              assetsImage(),
              const SizedBox(height: 30),
              networkImage(),
              const SizedBox(height: 30),
              imageWithShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget assetsImage() {
    return Column(
      children: [
        const Text("Assets Images: ",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Image.asset(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text("Unable To Load Assets Image..!");
          },
          "assets/1.png",
        ),
      ],
    );
  }

  Widget networkImage() {
    return Column(
      children: [
        const Text("Network Images: ",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Text("Unable To Load Network Image..!");
            },
            "https://marindakotze.files.wordpress.com/2013/08/231.jpg",
          ),
        ),
      ],
    );
  }

  Widget imageWithShimmer() {
    return Column(
      children: [
        const Text("Network Images with shimmer: ",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        FancyShimmerImage(
            // errorWidget: const Text("Enable to loading image"),
            boxFit: BoxFit.contain,
            // height: 150,
            // width: MediaQuery.sizeOf(context).width,
            imageUrl:
                "https://t3.ftcdn.net/jpg/01/40/51/56/360_F_140515612_0MMpqpsIvs6xno5YXmPVy9FUmZ4uLnFB.jpg")
      ],
    );
  }
}
