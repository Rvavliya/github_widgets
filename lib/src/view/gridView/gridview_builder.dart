import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class GridviewBuilderExample extends StatefulWidget {
  const GridviewBuilderExample({super.key});

  @override
  State<GridviewBuilderExample> createState() => _GridviewBuilderExampleState();
}

class _GridviewBuilderExampleState extends State<GridviewBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("GridView Builder"),
      ),
      body: GridView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1, // chid widget ratio
          crossAxisSpacing: 10, // cross spacing
          mainAxisExtent: 200, // child widget height
          mainAxisSpacing: 10, // main spcaing
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            header: GridTileBar(
              title:
                  Text('$index', style: const TextStyle(color: Colors.black)),
            ),
            child: Container(
              margin: const EdgeInsets.all(12.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                gradient: const RadialGradient(
                  colors: <Color>[Color(0x0F88EEFF), Color(0x2F0099BB)],
                ),
              ),
              child: const FlutterLogo(),
            ),
          );
        },
      ),
    );
  }
}
