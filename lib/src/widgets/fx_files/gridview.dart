import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/theme.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';

class FxGridView extends StatefulWidget {
  final List<Screens> screens;
  const FxGridView({
    super.key,
    required this.screens,
  });

  @override
  State<FxGridView> createState() => FxGridViewState();
}

class FxGridViewState extends State<FxGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.screens.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 80,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.screens[index].navigation,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Center(
                child: Text(
                  widget.screens[index].fileName,
                  style: ConstTheme.text(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
