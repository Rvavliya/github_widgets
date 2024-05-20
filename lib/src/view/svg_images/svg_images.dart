import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SvgImages extends StatefulWidget {
  const SvgImages({super.key});

  @override
  State<SvgImages> createState() => _SvgImagesState();
}

class _SvgImagesState extends State<SvgImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("SVG Images"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          final category = dataList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  /// remove border color
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  // tilePadding: EdgeInsets.zero, //remove defulat peding.
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      category.keys.toString().removeBracketsAndCapitalize(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: category[category.keys
                                  .toString()
                                  .removeBracketsAndCapitalize()]
                              ?.length ??
                          0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 16 / 5),
                      itemBuilder: (context, index1) {
                        final emoji = category[category.keys
                                .toString()
                                .removeBracketsAndCapitalize()]?[index1] ??
                            "";
                        return SvgPicture.asset(emoji,
                            fit: BoxFit.contain,
                            semanticsLabel: 'A red up arrow');
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
