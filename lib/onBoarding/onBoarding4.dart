
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

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManger.onBoardingGradient4_1,
              ColorsManger.onBoardingGradient4_2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Image(
              image: AssetImage(AppAssets.onBoarding4),
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
                height: 360.h,
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
                      Text("Create Watchlists", style: AppStyles.white24bold),
                      Text(
                        "Save movies to your watchlist to keep",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "track of what you want to watch next.",
                        style: AppStyles.white16bold,
                      ),
                      Text(
                        "Enjoy films in various qualities.",
                        style: AppStyles.white16bold,
                      ),
                      Container(
                        width: double.infinity,
                        child: NextCustomCupertinoButton(
                          borderColor: ColorsManger.transparentColor,
                          text: "Next",
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
        type: PageTransitionType.rightToLeftPop,
        childCurrent: this,
        child:  Onboarding5(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Back(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRightPop,
        childCurrent: this,
        child: Onboarding3(),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}

