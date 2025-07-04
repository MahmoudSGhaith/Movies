import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/constants_manager.dart';
import 'package:movies/domain/entities/category_entity.dart';
import 'package:movies/main_layout/browse/widgets/custom_tab_bar.dart';
import 'package:movies/main_layout/widgets/movie_item.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  CategoryEntity selectedCategory = ConstantsManager.categories[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTabBar(
              categories: ConstantsManager.categories,
              selectedTabBg: ColorsManger.yellow,
              unselectedTabBg: ColorsManger.black,
              onCategoryTabClicked: (category) {
                selectedCategory = category;
                setState(() {});
              },
            ),
            SizedBox(height: 20.h),
            // Text(selectedCategory.name, style: TextStyle(color: Colors.red),)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: 20,
                itemBuilder: (context, index) => MovieItem() ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
