// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/utils/loader.dart';
import 'package:flutter_gallery/src/utils/regex.dart';
import 'package:flutter_gallery/src/utils/thirdparty.dart';
import 'package:flutter_gallery/src/view/authentication/signup.dart';
import 'package:flutter_gallery/src/view/home/home.dart';
import 'package:flutter_gallery/src/widgets/fx_files/button.dart';
import 'package:flutter_gallery/src/widgets/fx_files/text_form_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resentemailController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resentPasswordKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    getPackageInfo();
  }

  getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationWidget(),
      body: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailauthentication(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Loader.show(context);
                      await ThirdParty.signInWithGoogle().then((value) {
                        if (value != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                          Loader.hide();
                        } else {
                          Loader.hide();
                          Fluttertoast.showToast(
                              backgroundColor: Colors.grey.shade500,
                              msg: "Google SignIn Failed Please Try Again");
                        }
                      });
                    },
                    child: Container(
                      height: 35,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png'),
                    ),
                  ),
                  if (Platform.isIOS) ...{
                    GestureDetector(
                      onTap: () async {
                        Loader.show(context);
                        await ThirdParty.signInWithApple().then((value) {
                          log("valueee:$value");
                          if (value != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                            Loader.hide();
                          } else {
                            Loader.hide();
                            Fluttertoast.showToast(
                                backgroundColor: Colors.grey.shade500,
                                msg: "Apple SignIn Failed Please Try Again");
                          }
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                            'https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-icon-16.png'),
                      ),
                    ),
                  }
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailauthentication() {
    return Form(
      key: _loginKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CommonTextFormField(
              controller: _emailController,
              label: const Text('Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            CommonTextFormField(
              maxLines: 1,
              controller: _passwordController,
              label: const Text('Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }

                return null;
              },
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _forgotPassword(context: context),
              ],
            ),
            SizedBox(height: 20.h),
            ConstButton(
              buttonName: "SignIn",
              onTap: () {
                if (_loginKey.currentState!.validate()) {
                  Loader.show(context);
                  ThirdParty.signInWithEmail(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          context: context)
                      .then((value) {
                    if (value != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    }
                  });
                }
              },
            ),
            SizedBox(height: 16.0.h),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationWidget() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have and accout?"),
              SizedBox(width: 5.w),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: ConstColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            "v${_packageInfo.version} (${_packageInfo.buildNumber})",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            showAdaptiveDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                _resentemailController.clear();
                return AlertDialog(
                  surfaceTintColor: Colors.white,
                  backgroundColor: ConstColor.white,
                  title: const Text('Forgot password'),
                  content: Form(
                    key: _resentPasswordKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Enter Email to send rest password link'),
                        SizedBox(height: 10.h),
                        CommonTextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          hintText: Strings.emailLable,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(passwordFocus);
                          },
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
                          controller: _resentemailController,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.black,
                        onPressed: () async {
                          if (_resentPasswordKey.currentState!.validate()) {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: _resentemailController.text)
                                .then((value) {
                              Fluttertoast.showToast(
                                  msg: "Mail Sent Successfully");
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Send link',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
              color: ConstColor.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
