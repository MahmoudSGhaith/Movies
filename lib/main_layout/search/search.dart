import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/common_widgets/custom_text_form_field/custom_text_form_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: Column(
          children: [
            CustomTextFormField(
              controller: searchController,
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: AppStyles.white16medium,
              borderColor: ColorsManger.grey,
              filledColor: ColorsManger.grey,
            ),
            SizedBox(height: 20.h),
            Expanded(child: Center( child: Image.asset(AssetsManger.empty))),

          ],
        ),
      ),
    );
  }
}
