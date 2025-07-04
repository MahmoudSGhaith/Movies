import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/domain/entities/category_entity.dart';
import 'package:movies/main_layout/browse/widgets/custom_tab.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.onCategoryTabClicked,
  });

  final List<CategoryEntity> categories;
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final void Function(CategoryEntity) onCategoryTabClicked;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        onTap: (newIndex) {
          widget.onCategoryTabClicked(widget.categories[newIndex]);
          selectedIndex = newIndex;
          setState(() {});
        },
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelPadding: REdgeInsets.symmetric(horizontal: 8),
        tabs: widget.categories
            .map(
              (category) => CustomTab(
                category: category,
                selectedTabBg: widget.selectedTabBg,
                unselectedTabBg: widget.unselectedTabBg,
                isSelected:
                    widget.categories.indexOf(category) == selectedIndex,
              ),
            )
            .toList(),
      ),
    );
  }
}
