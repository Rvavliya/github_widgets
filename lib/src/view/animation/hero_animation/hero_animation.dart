import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_gallery/src/view/animation/hero_animation/details_screen.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class HeroAnimationExample extends StatefulWidget {
  const HeroAnimationExample({super.key});

  @override
  State<HeroAnimationExample> createState() => _HeroAnimationExampleState();
}

class _HeroAnimationExampleState extends State<HeroAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Hero Animation"),
      ),
      body: GridView.builder(
        itemCount: galleyImage.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          mainAxisExtent: 160,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(imageIndex: index),
                  ),
                );
              },
              child: Hero(
                tag: '$index',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        galleyImage[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
