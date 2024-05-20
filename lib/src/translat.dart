// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';

// class TranslateDemo extends StatefulWidget {
//   const TranslateDemo({super.key});

//   @override
//   State<TranslateDemo> createState() => _TranslateDemoState();
// }

// class _TranslateDemoState extends State<TranslateDemo> {
//   GoogleTranslator googleTranslator = GoogleTranslator();
//   String data = "zopto";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(),
//       body: Column(
//         children: [
//           Text(data),
//           ElevatedButton(
//             onPressed: () {
//               translate();
//             },
//             child: const Text("translate"),
//           ),
//         ],
//       ),
//     );
//   }

//   void translate() {
//     googleTranslator.translate(data, to: "hi").then((output) {
//       setState(() {
//         data = output.toString();
//       });
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';

// class TranslateDemo extends StatefulWidget {
//   const TranslateDemo({super.key});

//   @override
//   _TranslateDemoState createState() => _TranslateDemoState();
// }

// class _TranslateDemoState extends State<TranslateDemo> {
//   String data = "my name is zeelkumar sojitra";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Text(data),
//             ElevatedButton(
//               onPressed: () {
//                 translate("hi");
//               },
//               child: const Text("translate"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void translate(String languageCode) {
//     data.translateString(to: languageCode).then((output) {
//       setState(() {
//         data = output.toString();
//       });
//     });
//   }
// }

// extension Strings on String {
//   Future<String> translateString({required String to}) async {
//     GoogleTranslator translator = GoogleTranslator();
//     Translation translation = await translator.translate(this, to: to);
//     return translation.text;
//   }
// }

import 'package:flutter/material.dart';

class TranslateExample extends StatefulWidget {
  const TranslateExample({super.key});

  @override
  State<TranslateExample> createState() => _TranslateExampleState();
}

class _TranslateExampleState extends State<TranslateExample> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(children: []),
      ),
    );
  }
}

class Translations {
  final String en; // English translation
  final String fr; // French translation
  final String es; // Spanish translation

  Translations({
    required this.en,
    required this.fr,
    required this.es,
  });

  String operator [](String languageCode) {
    switch (languageCode) {
      case 'en':
        return en;
      case 'fr':
        return fr;
      case 'es':
        return es;
      default:
        return en; // Return the original string if no translation is found
    }
  }
}

Map<String, Translations> translationsMap = {
  "my name is zeelkumar sojitra": Translations(
      en: "My name is Zeelkumar Sojitra",
      fr: "Mon nom est Zeelkumar Sojitra",
      es: "Mi nombre es Zeelkumar Sojitra"),
};

extension StringExtensions on String {
  String translate({required String to}) {
    final translations = translationsMap[this];
    if (translations != null) {
      return translations[to];
    } else {
      return this;
    }
  }
}
