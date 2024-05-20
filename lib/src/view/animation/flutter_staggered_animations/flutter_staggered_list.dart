import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class StaggeredListAnimations extends StatefulWidget {
  const StaggeredListAnimations({super.key});

  @override
  State<StaggeredListAnimations> createState() =>
      _StaggeredListAnimationsState();
}

class _StaggeredListAnimationsState extends State<StaggeredListAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text(Strings.staggeredListAnimations),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: const SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        child: Center(
                          child: Text(
                            "Animation",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
