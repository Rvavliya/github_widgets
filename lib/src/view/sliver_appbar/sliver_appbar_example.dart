import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),

            /// floating property used to hide and unhide while screen is scrolling.
            floating: true,
            forceElevated: true,
            primary: true,
            centerTitle: true,

            /// stretch property used to add streched effect while screen is scrolling.
            stretch: true,
            bottom: const CommonAppBar(
              leading: SizedBox.shrink(),
              title: Text("Goa"),
            ),

            /// if you need to add second app bar
            backgroundColor: Colors.amber,
            pinned: true, // if you need to pinned appbar while scrolling time

            automaticallyImplyLeading: true,
            expandedHeight: 250.0,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: false,
                title: const Text(
                  'Goa',
                  style: TextStyle(color: Colors.black),
                ),
                background: Image.network(
                  'https://t3.ftcdn.net/jpg/01/40/51/56/360_F_140515612_0MMpqpsIvs6xno5YXmPVy9FUmZ4uLnFB.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}'),
                );
              },
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: true,
              childCount: 20,
              addSemanticIndexes: true,
            ),
          ),
        ],
      ),
    );
  }
}
