import 'package:flutter/material.dart';

import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/utils/loader.dart';
import 'package:flutter_gallery/src/utils/regex.dart';
import 'package:flutter_gallery/src/utils/thirdparty.dart';
import 'package:flutter_gallery/src/view/authentication/login.dart';
import 'package:flutter_gallery/src/widgets/fx_files/button.dart';
import 'package:flutter_gallery/src/widgets/fx_files/text_form_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _password = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Form(
        key: _signInKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                Text(
                  Strings.createAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  Strings.signUpSubTitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xff8C8C8C),
                  ),
                ),
                SizedBox(height: 30.h),
                CommonTextFormField(
                  controller: _nameController,
                  label: const Text('Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0.h),
                CommonTextFormField(
                  textInputAction: TextInputAction.done,
                  controller: _emailController,
                  label: const Text('Email'),
                  keyboardType: TextInputType.emailAddress,
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
                ),
                SizedBox(height: 16.0.h),
                ValueListenableBuilder(
                  valueListenable: _password,
                  builder: (BuildContext context, value, Widget? child) {
                    return CommonTextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      obscureText: _password.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _password.value = !_password.value;
                        },
                        icon: Icon(_password.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      controller: _passwordController,
                      label: const Text('Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Strings.enterPassword;
                        } else if (value.length < 6) {
                          return "Please enter at least 6 digit!";
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 16.0.h),
                ConstButton(
                  onTap: () {
                    if (_signInKey.currentState!.validate()) {
                      Loader.show(context);
                      ThirdParty.signUpWithEmail(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              context: context)
                          .then(
                        (value) {
                          if (value != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  buttonName: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
