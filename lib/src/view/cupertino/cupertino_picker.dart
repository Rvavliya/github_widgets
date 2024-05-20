import 'package:flutter/cupertino.dart';

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  State<CupertinoPickerExample> createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  final ValueNotifier<int> _selectedFruit = ValueNotifier<int>(0);
  final double _kItemExtent = 32.0;
  final List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoPicker'),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Selected fruit: '),
              ValueListenableBuilder(
                valueListenable: _selectedFruit,
                builder: (BuildContext context, int value, Widget? child) =>
                    CupertinoButton(
                  padding: EdgeInsets.zero,
                  // Display a CupertinoPicker with list of fruits.
                  onPressed: () => _showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: _kItemExtent,
                      // This sets the initial item.
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedFruit.value,
                      ),
                      onSelectedItemChanged: (int selectedItem) {
                        _selectedFruit.value = selectedItem;
                      },
                      children: List<Widget>.generate(
                        _fruitNames.length,
                        (int index) {
                          return Center(
                            child: Text(
                              _fruitNames[index],
                            ),
                          );

                          /// selecte to close dilog
                          // return Center(
                          //   child: TextButton(
                          //     onPressed: () {
                          //       Navigator.pop(context);
                          //     },
                          //     child: Text(
                          //       _fruitNames[index],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                  // This displays the selected fruit name.
                  child: Text(
                    _fruitNames[_selectedFruit.value],
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
