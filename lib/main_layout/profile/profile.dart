import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/main_layout/profile/widgets/custom_tab_bar_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(color: ColorsManger.grey),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(AssetsManger.player1),
                          SizedBox(height: 6.h),
                          Text("Mohamed", style: AppStyles.white20bold),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("12", style: AppStyles.white36bold),
                          SizedBox(height: 6.h),
                          Text("Wish list", style: AppStyles.white24bold),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("12", style: AppStyles.white36bold),
                          SizedBox(height: 6.h),
                          Text("History", style: AppStyles.white24bold),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, AppRoutes.editProfile);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManger.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          "Edit Profile",
                          style: AppStyles.black20medium,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManger.red,
                          foregroundColor: ColorsManger.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Exit", style: AppStyles.white20medium),
                            SizedBox(width: 4.w),
                            Icon(Icons.exit_to_app),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                DefaultTabController(
                  length: 2,
                  child: TabBar(
                    indicatorColor: ColorsManger.yellow,
                    dividerColor: ColorsManger.transparentColor,
                    labelPadding: REdgeInsets.all(8),
                    tabs: [
                      CustomTabBarProfileItem(title: "Watch List", image: AssetsManger.watchList,),
                      CustomTabBarProfileItem(title: "History", image: AssetsManger.folder,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Center(child: Image.asset(AssetsManger.empty),))
        
      ],
    );
  }
}
