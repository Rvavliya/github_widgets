import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class JsonData extends StatelessWidget {
  const JsonData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Print jsonFile Data"),
      ),
      body: FutureBuilder(
        future: loadJsonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${snapshot.data!.keys}'),
                  Text('Age: ${snapshot.data!.values}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

/// load asets json file data
Future<Map<String, dynamic>> loadJsonData() async {
  final jsonString = await rootBundle.loadString('assets/sample.json');
  final jsonData = jsonDecode(jsonString);
  return jsonData;
}
