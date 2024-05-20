import 'dart:developer';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class CountriesWorldMapExample extends StatefulWidget {
  const CountriesWorldMapExample({super.key});

  @override
  State<CountriesWorldMapExample> createState() =>
      _CountriesWorldMapExampleState();
}

class _CountriesWorldMapExampleState extends State<CountriesWorldMapExample>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Countries World Map"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _countryMap(),
        ],
      ),
    );
  }

  Widget _countryMap() {
    return SimpleMap(
      defaultColor: Colors.grey.shade200,
      countryBorder: const CountryBorder(color: Colors.grey),
      instructions: SMapWorld.instructionsMercator,
      colors: const SMapWorldColors(
        iN: Colors.green,
        uS: Colors.purple,
        bR: ConstColor.primary,
        cA: Colors.yellow,
        rU: Colors.blue,
      ).toMap(),
      callback: (id, name, tapdetails) {
        log(id);
        log(name);
        log(tapdetails.localPosition.toString());
      },
    );
  }
}
