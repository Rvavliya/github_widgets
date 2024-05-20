import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
// import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class FlutterButtons extends StatefulWidget {
  const FlutterButtons({super.key});

  @override
  State<FlutterButtons> createState() => FlutterButtonsState();
}

class FlutterButtonsState extends State<FlutterButtons> {
  final ValueNotifier<bool> _istap = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _istap1 = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Button Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _elevatedButtonWidget(),
              const SizedBox(height: 20),
              _materialButtonWidget(),
              const SizedBox(height: 20),
              _textButtonWidget(),
              const SizedBox(height: 20),
              _iconButtonwidget(),
              const SizedBox(height: 20),
              _backButtonWidget(),
              const SizedBox(height: 20),
              _reactionButton(),
              const SizedBox(height: 20),
              _buttonWithLoader(),
              const SizedBox(height: 20),
              _buttonWithLoader1(),
              const SizedBox(height: 20),
              _outlineButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outlineButton() {
    return Column(
      children: [
        const Text(
          "Outline Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Outline Button'),
        )
      ],
    );
  }

  Widget _elevatedButtonWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Elevated Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          autofocus: true,
          // clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            elevation: 2,
            maximumSize: const Size(150, 50),
          ),
          onPressed: () {},
          child: const Text(
            "Press",
            style: TextStyle(color: Colors.white),
          ),
        )
            .animate()
            .then(duration: 700.milliseconds)
            .slide(
              begin: const Offset(0, 0),
              end: const Offset(0, 0),
            )
            .fadeIn(),
      ],
    );
  }

  Widget _materialButtonWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Material Button"),
        const SizedBox(height: 20),
        MaterialButton(
          onPressed: () {},
          animationDuration: const Duration(seconds: 1),
          color: Colors.indigo,
          elevation: 2,
          height: 60,
          minWidth: 150,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textColor: Colors.white,
          disabledElevation: 12,
          child: const Text("Press"),
        ),
      ],
    );
  }

  Widget _textButtonWidget() {
    return Column(
      children: [
        const Text(
          "Text Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.indigo),
            elevation: MaterialStatePropertyAll(2),
            animationDuration: Duration(seconds: 1),
          ),
          onPressed: () {},
          child: const Text(
            "Press",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _iconButtonwidget() {
    return Column(
      children: [
        const Text(
          "Icon Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        IconButton(
          color: Colors.indigo,
          // constraints: BoxConstraints.loose(Size.zero),
          style: const ButtonStyle(
            animationDuration: Duration(seconds: 1),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _backButtonWidget() {
    return Column(
      children: [
        const Text(
          "Back Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _reactionButton() {
    return Column(
      children: [
        const Text(
          "Reaction Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        ReactionButton<String>(
          onReactionChanged: (Reaction<String>? reaction) {
            debugPrint('Selected value: ${reaction?.value}');
          },
          reactions: const <Reaction<String>>[
            Reaction<String>(
              value: 'like',
              icon: Icon(Icons.abc),
            ),
            Reaction<String>(
              value: 'love',
              icon: Icon(Icons.abc),
            ),
          ],
          selectedReaction: const Reaction<String>(
            value: 'like',
            icon: Icon(Icons.access_alarm_outlined),
          ),
          itemSize: const Size(30, 30),
          child: const Text("React"),
        ),
      ],
    );
  }

  /// loader display in a outside
  Widget _buttonWithLoader() {
    return Column(
      children: [
        const Text(
          "Button With Loader",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _istap,
          builder: (BuildContext context, value, Widget? child) {
            return MaterialButton(
              height: _istap.value ? 0 : 50,
              minWidth: _istap.value ? 0 : 150,
              textColor: Colors.white,
              color: _istap.value ? null : Colors.indigo,
              onPressed: () async {
                _istap.value = true;
                await Future.delayed(const Duration(seconds: 2));
                _istap.value = false;
              },
              child: _istap.value
                  ? const CircularProgressIndicator(
                      color: Colors.black,
                    )
                  : const Text("Data"),
            );
          },
        ),
      ],
    );
  }

  /// loader display in a child widget
  Widget _buttonWithLoader1() {
    return Column(
      children: [
        const Text(
          "Button With Loader",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: _istap1,
          builder: (BuildContext context, value, Widget? child) {
            return MaterialButton(
              height: 50,
              minWidth: 150,
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: () async {
                _istap1.value = true;
                await Future.delayed(const Duration(seconds: 2));
                _istap1.value = false;
              },
              child: _istap1.value
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text("Data"),
            );
          },
        ),
      ],
    );
  }
}
