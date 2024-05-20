import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DefualtTabBarExample extends StatefulWidget {
  const DefualtTabBarExample({super.key});

  @override
  State<DefualtTabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<DefualtTabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text("Tab Bar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Center(
              child: Text("Home"),
            ),
            Center(
              child: Text("Profile"),
            ),
            Center(
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}
