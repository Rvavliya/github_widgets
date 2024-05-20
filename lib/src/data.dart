// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MakeOfferBox extends StatefulWidget {
  const MakeOfferBox({super.key});

  @override
  _MakeOfferBoxState createState() => _MakeOfferBoxState();
}

class _MakeOfferBoxState extends State<MakeOfferBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
