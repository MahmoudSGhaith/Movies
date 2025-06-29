import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_validator.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/change_app_language/change_app_language.dart';
import 'package:movies/core/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showPasswordSecure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                Image(
                  image: AssetImage(AssetsManger.mainLogo),
                  width: 120.w,
                  height: 120.h,
                ),
                SizedBox(height: 50.h),
                Form(
                  child: Column(
                    children: [
                      //email_text_form_field
                      CustomTextFormField(
                        validator: (p0) {
                          AppValidator.validateUserName;
                        },
                        controller: _userNameController,
                        borderColor: ColorsManger.grey,
                        filledColor: ColorsManger.grey,
                        prefixIcon: Icon(Icons.email, size: 30),
                        textLabel: AppLocalizations.of(context)!.email,
                        labelStyle: AppStyles.white16medium,
                      ),
                      SizedBox(height: 25.h),
                      //password_text_form_field
                      CustomTextFormField(
                        validator: (p0) {
                          AppValidator.validatePassword;
                        },
                        controller: _passwordController,
                        isObscureText: showPasswordSecure,
                        borderColor: ColorsManger.grey,
                        filledColor: ColorsManger.grey,
                        prefixIcon: Icon(Icons.lock, size: 30),
                        textLabel: AppLocalizations.of(context)!.password,
                        labelStyle: AppStyles.white16medium,
                        suffixIcon: IconButton(
                          onPressed: showPassword,
                          icon: Icon(Icons.visibility_off),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      // forget_password
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //todo : goto forget password screen
                            Navigator.pushNamed(
                              context,
                              AppRoutes.forgetPassword,
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgotPassword,
                            style: AppStyles.yellow16medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //login button
                      Container(
                        width: double.infinity,
                        child: CustomCupertinoButton(
                          borderColor: ColorsManger.yellow,
                          backgroundColor: ColorsManger.yellow,
                          text: AppLocalizations.of(context)!.login,
                          onPress: () {},
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //create account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.dontHaveAccount,
                            style: AppStyles.white14medium,
                          ),
                          TextButton(
                            onPressed: () {
                              //todo : create new account .. go to register screen
                              Navigator.pushNamed(
                                context,
                                AppRoutes.registerScreen,
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.createAccount,
                              style: AppStyles.yellow14medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      //or
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            height: 1,
                            color: ColorsManger.yellow,
                            thickness: 1.5,
                            endIndent: 50.w,
                            indent: 50.w,
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: ColorsManger.black,
                            width: 50.w,
                            height: 50.h,
                            child: Text(
                              AppLocalizations.of(context)!.or,
                              style: AppStyles.yellow16medium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      //login_with_google
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            child: CustomCupertinoButton(
                              backgroundColor: ColorsManger.yellow,
                              borderColor: ColorsManger.yellow,
                              text: AppLocalizations.of(
                                context,
                              )!.loginWithGoogle,
                              onPress: () {},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Image(
                              image: AssetImage(AssetsManger.google),
                              width: 55.w,
                              height: 55.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      ChangeAppLanguage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPassword() {
    showPasswordSecure = !showPasswordSecure;
    setState(() {});
  }
}
