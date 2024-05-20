// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';

Future<String?> showCustomDialog({
  required BuildContext context,
  String? title,
  String? content,
  List<String>? actions,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: context.color.background,
        surfaceTintColor: context.color.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(title??""),
        titleTextStyle: TextStyle(
          fontSize: 20.0,
          color: context.color.onBackground,
        ),
        content: Text(content!),
        actions: [
          if (actions!.length == 1) ...[
            SizedBox(
              height: 32.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 8.0)),
                  elevation: const MaterialStatePropertyAll(0.0),
                  backgroundColor:
                      MaterialStatePropertyAll(context.color.primary),
                  foregroundColor:
                      MaterialStatePropertyAll(context.color.onPrimary),
                ),
                onPressed: () => Navigator.pop(context, actions[0]),
                child: Text(actions[0]),
              ),
            ),
          ],
          if (actions.length != 1 && actions.first == Strings.no) ...[
            SizedBox(
              height: 32.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 8.0)),
                  elevation: const MaterialStatePropertyAll(0.0),
                  backgroundColor:
                      MaterialStatePropertyAll(context.color.error),
                  foregroundColor:
                      MaterialStatePropertyAll(context.color.onError),
                ),
                onPressed: () => Navigator.pop(context, actions[0]),
                child: Text(actions[0]),
              ),
            ),
            SizedBox(
              height: 32.0,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 8.0)),
                    elevation: const MaterialStatePropertyAll(0.0),
                    backgroundColor:
                        const MaterialStatePropertyAll(ConstColor.black),
                    foregroundColor:
                        MaterialStatePropertyAll(context.color.onPrimary)),
                onPressed: () => Navigator.pop(context, actions[1]),
                child: Text(actions[1]),
              ),
            ),
          ],
          if (actions.length != 1 && actions.first != Strings.no) ...[
            SizedBox(
              height: 32.0,
              child: TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                onPressed: () => Navigator.pop(context, actions[0]),
                child: Text(actions[0]),
              ),
            ),
            SizedBox(
              height: 32.0,
              child: TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                onPressed: () => Navigator.pop(context, actions[1]),
                child: Text(actions[1]),
              ),
            ),
          ]
        ],
        actionsAlignment: MainAxisAlignment.spaceEvenly,
      );
    },
  );
}
