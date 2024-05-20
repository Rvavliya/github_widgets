import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gallery/src/provider/get_api/bloc/get_api_bloc.dart';
import 'package:flutter_gallery/src/view/api/loading.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class GetApiExample extends StatefulWidget {
  const GetApiExample({super.key});

  @override
  State<GetApiExample> createState() => _GetApiExampleState();
}

class _GetApiExampleState extends State<GetApiExample> {
  @override
  void initState() {
    super.initState();

    getApiBloc.add(const GetApiEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getApiBloc,
      child: Scaffold(
        appBar: const CommonAppBar(title: Text("Get Api Example")),
        body: BlocBuilder<GetApiBloc, GetApiState>(
          bloc: getApiBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const LoadingState(),
              success: (getApiData) {
                log("Data length${getApiData.length}");
                return ListView.builder(
                  itemCount: getApiData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(getApiData[index]['id'].toString()),
                      title: Text(getApiData[index]['title']),
                    );
                  },
                );
              },
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
