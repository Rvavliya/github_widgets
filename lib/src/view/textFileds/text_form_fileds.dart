import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/utils/regex.dart';
import 'package:flutter_gallery/src/widgets/fx_files/date_time_picker.dart';
import 'package:flutter_gallery/src/widgets/fx_files/text_form_filed.dart';

class TextFormFieldsScreen extends StatefulWidget {
  const TextFormFieldsScreen({super.key});

  @override
  State<TextFormFieldsScreen> createState() => _TextFormFieldsScreenState();
}

class _TextFormFieldsScreenState extends State<TextFormFieldsScreen> {
  final TextEditingController _middalName = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _closeTime = TextEditingController();
  final TextEditingController _autoCompletTextField = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _price = TextEditingController();
  ValueNotifier<bool> password = ValueNotifier<bool>(true);
  ValueNotifier<bool> confrimPassword = ValueNotifier<bool>(true);
  final GlobalKey<FormState> _textFiledKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: const CommonAppBar(
          title: Text(
            "TextFields",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
          child: SingleChildScrollView(
            child: Form(
              key: _textFiledKey,
              child: Column(
                children: [
                  _firstNameWidget(),
                  _sizedBox(),
                  _lastNameWidget(),
                  _sizedBox(),
                  _nameWidget(),
                  _sizedBox(),
                  _email(),
                  _sizedBox(),
                  _phoneNumberWidget(),
                  _sizedBox(),
                  _addressWidget(),
                  _sizedBox(),
                  _closeTimeWidget(),
                  _sizedBox(),
                  _autoCompletTextFieldWidget(),
                  _sizedBox(),
                  _passWord(),
                  _sizedBox(),
                  _confirmPasswordWiget(),
                  _sizedBox(),
                  _priceWidget(),
                  _sizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          hintText: Strings.emailLable,
          validator: (value) {
            final bool emailValid = EmailPasswordRegx
                .emailPasswordRegex.emailRegExp
                .hasMatch(value!);
            if (value.isEmpty) {
              return Strings.enterEmailId;
            } else if (emailValid) {
              return null;
            } else {
              return Strings.emailError;
            }
          },
          controller: _emailController,
        ),
      ],
    );
  }

  Widget _sizedBox() {
    return SizedBox(height: 10.h);
  }

  Widget _firstNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("First Name", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          suffixIcon: const Icon(Icons.person),
          onChanged: (value) {
            log(value);
          },
          // inputFormatters: [PriceTextInputFormatter()],

          hintText: Strings.firstName,
          validator: (value) {
            if (value!.isEmpty) {
              return Strings.enterFirsttName;
            } else {
              return null;
            }
          },
          controller: _firstName,
        ),
      ],
    );
  }

  Widget _priceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          hintText: "Price",
          controller: _price,
          inputFormatters: [PriceTextInputFormatter()],
        ),
      ],
    );
  }

  Widget _lastNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Last Name", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: Strings.lastName,
          validator: (value) {
            if (value!.isEmpty) {
              return Strings.enterLastName;
            } else {
              return null;
            }
          },
          controller: _lastName,
        ),
      ],
    );
  }

  Widget _nameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: Strings.name,
          validator: (value) {
            if (value!.isEmpty) {
              return Strings.enterName;
            } else {
              return null;
            }
          },
          controller: _middalName,
        ),
      ],
    );
  }

  Widget _phoneNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phone number",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 10,
          counterText: "",
          keyboardType: TextInputType.phone,
          hintText: Strings.phoneLable,
          validator: (value) {
            if (value!.isEmpty) {
              return Strings.enterPhoneNumber;
            } else if (value.length != 10) {
              return Strings.phoneNmuberLength;
            }
            return null;
          },
          controller: _phoneNumber,
        ),
      ],
    );
  }

  Widget _addressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.streetAddress,
          hintText: Strings.address,
          maxLines: 5,
          validator: (value) {
            if (value!.isEmpty) {
              return Strings.enterAddress;
            } else {
              return null;
            }
          },
          controller: _address,
        ),
      ],
    );
  }

  Widget _closeTimeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Close Time", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        CommonTextFormField(
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          hintText: Strings.closeTime,
          readOnly: true,
          onTap: () {
            showDateTimePicker(
              context: context,
              onDateTimeChanged: (newDateTime) {
                _closeTime.text =
                    (DateFormat("yyyy-MM-dd HH:mm").format(newDateTime));
              },
              initialDateTime: DateTime.now(),
            );
          },
          controller: _closeTime,
        ),
      ],
    );
  }

  Widget _autoCompletTextFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Auto Complete",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.length < 3) {
              return [];
            }
            final emailExtensions = ['India', 'Australia', 'canada'];
            final filteredEmailExtensions = emailExtensions
                .where(
                    (extension) => extension.startsWith(textEditingValue.text))
                .toList();

            return filteredEmailExtensions;
          },
          onSelected: (option) {
            _autoCompletTextField.text = option;
          },
        ),
      ],
    );
  }

  Widget _passWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: password,
          builder: (context, value, child) {
            return CommonTextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              obscureText: password.value,
              suffixIcon: IconButton(
                onPressed: () {
                  password.value = !password.value;
                },
                icon: password.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              hintText: Strings.passwordLable,
              validator: (value) {
                final bool passwordValid = EmailPasswordRegx
                    .emailPasswordRegex.passwordRegExp
                    .hasMatch(value!);
                if (value.isEmpty) {
                  return Strings.enterPassword;
                } else if (passwordValid) {
                  return null;
                } else {
                  return Strings.passwordError;
                }
              },
              controller: _password,
            );
          },
        ),
      ],
    );
  }

  Widget _confirmPasswordWiget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Confirm Password",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: confrimPassword,
          builder: (context, value, child) {
            return CommonTextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              obscureText: confrimPassword.value,
              suffixIcon: IconButton(
                onPressed: () {
                  confrimPassword.value = !confrimPassword.value;
                },
                icon: confrimPassword.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              hintText: Strings.passwordLable,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.enterPassword;
                } else if (value != _password.text) {
                  return Strings.checkConfirmpassword;
                } else {
                  return null;
                }
              },
              controller: _confirmPassword,
            );
          },
        ),
      ],
    );
  }
}

class PriceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;

    String cleanedText =
        newValue.text.replaceAll(',', ''); // Remove existing commas
    final formattedValue = _formatAsPrice(cleanedText);

    // Calculate cursor position
    if (newValue.text != formattedValue) {
      if (newValue.selection.end >= 0 && newValue.selection.start >= 0) {
        final cursorPosition =
            formattedValue.length - (newTextLength - selectionIndex);
        selectionIndex = cursorPosition.clamp(0, formattedValue.length);
      }
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  String _formatAsPrice(String amount) {
    List<String> parts = amount.split('.');
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] = parts[0].replaceAllMapped(reg, (Match match) => '${match[1]},');
    return parts.join('.');
  }
}
