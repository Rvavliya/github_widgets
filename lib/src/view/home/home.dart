// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/provider/cubit/connection_cubit.dart';
import 'package:flutter_gallery/src/provider/home/bloc/home_bloc.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive_utils.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/view/authentication/login.dart';
import 'package:flutter_gallery/src/view/home/drawer.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> _isSearchCheck = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen(
      (result) {
        context.read<ConnectivityCubit>().chcekConnectivity(result, context);
      },
    );
    homeBloc.add(const HomeEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _conformationDilog(context: context),
      child: Scaffold(
        drawer: const DrawerScreen(),
        appBar: _appBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const CircularProgressIndicator.adaptive(),
              success: (screens) {
                if (screens.isEmpty) {
                  return const Center(
                    child: Text(Strings.noDataFound),
                  );
                }
                return FxGridView(
                  screens: screens,
                );
              },
              error: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  CommonAppBar _appBar() {
    return CommonAppBar(
      title: ValueListenableBuilder(
        valueListenable: _isSearchCheck,
        builder: (BuildContext context, bool value, Widget? child) {
          return _isSearchCheck.value
              ? CupertinoSearchTextField(
                  placeholder: Strings.search,
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black),
                  autofocus: true,
                  onChanged: (value) {
                    homeBloc.add(HomeEvent.search(value));
                  },
                )
              : const Text(Strings.homePage);
        },
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: _isSearchCheck,
          builder: (BuildContext context, bool value, Widget? child) {
            return IconButton(
              onPressed: () async {
                _isSearchCheck.value = !_isSearchCheck.value;
                log(_isSearchCheck.value.toString());
                _isSearchCheck.notifyListeners();
                homeBloc.add(const HomeEvent.started());
              },
              icon: Icon(_isSearchCheck.value ? Icons.close : Icons.search),
            );
          },
        ),
      ],
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
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  // shadowColor: Colors.transparent,
                  // foregroundColor: Colors.transparent,
                  // surfaceTintColor: Colors.transparent,
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
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      },
    );
  }
}
