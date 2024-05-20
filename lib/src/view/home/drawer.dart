// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/constant/theme.dart';
import 'package:flutter_gallery/src/provider/cubit/theme_cubit.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/view/authentication/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 50.sp),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(radius: 25),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                HiveUtils.isContainKey(HiveKeys.userName)
                                    ? HiveUtils.get(HiveKeys.userName) ?? ""
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  HiveUtils.isContainKey(HiveKeys.loginEmail)
                                      ? HiveUtils.get(HiveKeys.loginEmail) ?? ""
                                      : "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              context.read<ThemeCubit>().upDateTheme();
              HiveUtils.set(HiveKeys.isDarkMode, context.isDarkMode);
            },
            child: ListTile(
              leading:
                  Icon(context.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              title: const Text(Strings.changeThem),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await _conformationDilog(context: context);
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text(Strings.logout),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _conformationDilog({required BuildContext context}) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          surfaceTintColor: Colors.white,
          backgroundColor: ConstColor.white,
          title: const Text('Confirm logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: ConstTheme.subTitleText(context).copyWith(
                  color: ConstColor.green,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              onPressed: () async {
                await HiveUtils.clear().then(
                  (value) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              child: Text(
                'Yes',
                style: ConstTheme.subTitleText(context).copyWith(
                  color: ConstColor.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
