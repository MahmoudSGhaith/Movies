
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/onBoarding/onBoarding5.dart';
import 'package:page_transition/page_transition.dart';

import '../common_widgets/cupertino_button/Next_custom_cupertino_button.dart';
import '../common_widgets/cupertino_button/back_custom_cupertino_button.dart';
import '../core/app_assets.dart';
import '../core/app_styles.dart';
import '../core/colors_manger.dart';
import 'onBoarding3.dart';
import 'onBoarding4.dart';
import 'onBoarding6.dart';

class Onboarding6 extends StatelessWidget {
  const Onboarding6({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManger.onBoardingGradient5_1,
              ColorsManger.onBoardingGradient5_2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(AppAssets.onBoarding6),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                  color: ColorsManger.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.r),
                    topRight: Radius.circular(70.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Start Watching Now", style: AppStyles.white24bold),
                      Container(
                        width: double.infinity,
                        child: NextCustomCupertinoButton(
                          borderColor: ColorsManger.transparentColor,
                          text: "Finish",
                          backgroundColor: ColorsManger.yellow,
                          onPress: () {
                            Next(context);
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: BackCustomCupertinoButton(
                          borderColor: ColorsManger.yellow,
                          text: "Back",
                          backgroundColor: ColorsManger.black,
                          onPress: () {
                            Back(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Next(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTopPop,
        childCurrent: this,
        child:  Onboarding6(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Back(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.topToBottomPop,
        childCurrent: this,
        child: Onboarding5(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

