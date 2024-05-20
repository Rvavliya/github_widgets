import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/text_form_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class QrCodeExample extends StatefulWidget {
  const QrCodeExample({super.key});

  @override
  State<QrCodeExample> createState() => _QrCodeExampleState();
}

class _QrCodeExampleState extends State<QrCodeExample> {
  final TextEditingController _firstName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("QR Code"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameWidget(),
              SizedBox(height: 10.sp),
              const Text(
                "Simple Qr code:-",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.sp),
              Center(
                child: QrImageView(
                  data: _firstName.text,
                  version: QrVersions.auto,
                  size: 200.0,
                  gapless: false,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Qr code with image:-",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: QrImageView(
                  data: _firstName.text,
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                  embeddedImage: const AssetImage('assets/completed.png'),
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(50, 50), //logo size
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Qr code with error handaling:-",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: QrImageView(
                  data: _firstName.text,
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                  errorStateBuilder: (cxt, err) {
                    return const Center(
                      child: Text(
                        'Uh oh! Something went wrong...',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("QrCode Data",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: "Enter data to genrate qrCode",
          onChanged: (p0) {
            setState(() {});
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Please enter qrCode Data";
            } else {
              return null;
            }
          },
          controller: _firstName,
        ),
      ],
    );
  }
}
