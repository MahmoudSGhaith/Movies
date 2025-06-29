import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/common_widgets/change_app_language/change_app_language.dart';
import 'package:movies/common_widgets/cupertino_button/custom_cupertino_button.dart';
import 'package:movies/common_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:movies/core/app_validator.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/l10n/app_localizations.dart';

import '../../common_widgets/CustomCarouselSlider/CustomCarouselSlider.dart';
import '../../core/app_routes.dart';
import '../../core/app_toast.dart';

class RegiesterScreen extends StatefulWidget {
  const RegiesterScreen({super.key});

  @override
  State<RegiesterScreen> createState() => _RegiesterScreenState();
}

class _RegiesterScreenState extends State<RegiesterScreen> {
  late bool showPasswordSecure = true;
  late bool showRePasswordSecure = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.yellow20medium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CarouselSlider(
                items: [
                  CustomCarouselSlider(imagePath: AssetsManger.player1),
                  CustomCarouselSlider(imagePath: AssetsManger.player2),
                  CustomCarouselSlider(imagePath: AssetsManger.player3),
                  CustomCarouselSlider(imagePath: AssetsManger.player4),
                  CustomCarouselSlider(imagePath: AssetsManger.player5),
                  CustomCarouselSlider(imagePath: AssetsManger.player6),
                  CustomCarouselSlider(imagePath: AssetsManger.player7),
                  CustomCarouselSlider(imagePath: AssetsManger.player8),
                  CustomCarouselSlider(imagePath: AssetsManger.player9),
                ],
                options: CarouselOptions(
                  height: 0.175.sh,
                  // Control the height of the carousel
                  enlargeCenterPage: true,
                  viewportFraction: 0.35,
                  // Makes the images bigger (80% of screen width)
                  enableInfiniteScroll: true,
                ),
              ),
              SizedBox(height: 5.h),
              Text("Avatar", style: AppStyles.white16medium),
              SizedBox(height: 5.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // user name
                    CustomTextFormField(
                      validator: AppValidator.validateFullName,
                      controller: userNameController,
                      filledColor: ColorsManger.grey,
                      prefixIcon: Icon(Icons.person, size: 30),
                      textLabel: AppLocalizations.of(context)!.username,
                      labelStyle: AppStyles.white20medium,
                    ),
                    SizedBox(height: 10.h),
                    //email
                    CustomTextFormField(
                      validator: AppValidator.validateEmail,
                      controller: emailController,
                      filledColor: ColorsManger.grey,
                      prefixIcon: Icon(Icons.email, size: 30),
                      textLabel: AppLocalizations.of(context)!.email,
                      labelStyle: AppStyles.white20medium,
                    ),
                    SizedBox(height: 10.h),
                    //password
                    CustomTextFormField(
                      validator: AppValidator.validatePassword,
                      controller: passwordController,
                      isObscureText: showPasswordSecure,
                      filledColor: ColorsManger.grey,
                      prefixIcon: Icon(Icons.lock, size: 30),
                      textLabel: AppLocalizations.of(context)!.password,
                      labelStyle: AppStyles.white20medium,
                      suffixIcon: IconButton(
                        onPressed: showPassword,
                        icon: Icon(
                          showPasswordSecure
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    //re_password
                    CustomTextFormField(
                      validator: (value) =>
                          AppValidator.validateConfirmPassword(
                            passwordController.text,
                            value,
                          ),
                      controller: rePasswordController,
                      isObscureText: showRePasswordSecure,
                      filledColor: ColorsManger.grey,
                      prefixIcon: Icon(Icons.lock, size: 30),
                      textLabel: AppLocalizations.of(context)!.rePassword,
                      labelStyle: AppStyles.white20medium,
                      suffixIcon: IconButton(
                        onPressed: showRePassword,
                        icon: Icon(showRePasswordSecure ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    //phone number
                    CustomTextFormField(
                      validator: AppValidator.validatePhoneNumber,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      filledColor: ColorsManger.grey,
                      prefixIcon: Icon(Icons.phone, size: 30),
                      textLabel: AppLocalizations.of(context)!.phoneNumber,
                      labelStyle: AppStyles.white20medium,
                    ),
                    SizedBox(height: 10.h),
                    //create account
                    CustomCupertinoButton(
                      backgroundColor: ColorsManger.yellow,
                      borderColor: ColorsManger.yellow,
                      text: AppLocalizations.of(context)!.createAccount,
                      onPress: submitSignup,
                    ),
                    SizedBox(height: 5.h),
                    // go to login screen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.alreadyHaveAccount,
                          style: AppStyles.white16medium,
                        ),
                        TextButton(
                          onPressed: () {
                            //todo : create new account .. go to register screen
                            Navigator.pushNamed(context, AppRoutes.loginScreen);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: AppStyles.yellow16medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    ChangeAppLanguage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPassword() {
    showPasswordSecure = !showPasswordSecure;
    setState(() {});
  }

  void showRePassword() {
    showRePasswordSecure = !showRePasswordSecure;
    setState(() {});
  }

  //todo: to confirm the registration is ok or no
  void submitSignup() {
    if (formKey.currentState!.validate()) {
      FlutterToast.toastMsg(
        "sign up successfully",
        ColorsManger.green,
        ColorsManger.white,
      );
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      });
    } else {
      FlutterToast.toastMsg(
        "please fill all fields correctly",
        ColorsManger.red,
        ColorsManger.white,
      );
    }
  }
}
