import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/app_styles.dart';
import 'package:movies/domain/entities/category_entity.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.category,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.isSelected
  });

  final CategoryEntity category;
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected? selectedTabBg : unselectedTabBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: selectedTabBg, width: 1),
      ),
      child: Text(category.name, style: isSelected? AppStyles.black20Bold : AppStyles.yellow20bold ),
    );
  }
}
