import 'package:flutter/cupertino.dart';
import 'package:flutter_gallery/src/constant/const.dart';

class CupertinoSearchTextFiledExample extends StatefulWidget {
  const CupertinoSearchTextFiledExample({super.key});

  @override
  State<CupertinoSearchTextFiledExample> createState() =>
      _CupertinoSearchTextFiledExampleState();
}

class _CupertinoSearchTextFiledExampleState
    extends State<CupertinoSearchTextFiledExample> {
  // List<String> data = [];
  final ValueNotifier<List<String>> _searchData =
      ValueNotifier<List<String>>([""]);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();

        /// close keyb
      },
      child: CupertinoPageScaffold(
        navigationBar:
            const CupertinoNavigationBar(middle: Text("Search TextFiled")),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoSearchTextField(
                    onChanged: (value) {
                      _searchData.value = list
                          .where((element) => element
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    },
                    autocorrect: true,
                    autofocus: true,
                    enableIMEPersonalizedLearning: true,

                    /// give a suggestion for user
                    smartDashesType: SmartDashesType.enabled,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _searchData,
                  builder: (BuildContext context, List<String> value,
                      Widget? child) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 50),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.length,
                      itemBuilder: (context, index) => Center(
                        child: Text(
                          value[index],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
