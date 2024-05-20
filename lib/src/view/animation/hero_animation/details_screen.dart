import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
class DetailsPage extends StatefulWidget {
  final int imageIndex;

  const DetailsPage({
    super.key,
    required this.imageIndex,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final PageController controller;
  double pageIndex = 0;

  @override
  void initState() {
    controller = PageController(
      initialPage: widget.imageIndex,
    );
    controller.addListener(
      () {
        setState(
          () {
            pageIndex = controller.page! + 1;
          },
        );
      },
    );
    pageIndex = widget.imageIndex + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("${pageIndex.toInt()}/${galleyImage.length}"),
      ),
      body: Hero(
        tag: "${widget.imageIndex}",
        child: InteractiveViewer(
          child: PageView.builder(
            controller: controller,
            itemCount: galleyImage.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      galleyImage[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
