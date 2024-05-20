import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class StaggeredGridAnimations extends StatefulWidget {
  const StaggeredGridAnimations({super.key});

  @override
  State<StaggeredGridAnimations> createState() =>
      _StaggeredGridAnimationsState();
}

class _StaggeredGridAnimationsState extends State<StaggeredGridAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text(Strings.staggeredGridAnimations),
      ),
      body: AnimationLimiter(
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) =>
              AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: const ScaleAnimation(
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
          ),
        ),
      ),
    );
  }
}
