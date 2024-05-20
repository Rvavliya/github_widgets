import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/widgets/shimmer/shimmer.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Shimmer.fromColors(
              child: Container(
                height: 50,
                width: 40,
                decoration: const BoxDecoration(
                  color: ConstColor.black,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            title: Shimmer.fromColors(
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ConstColor.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
