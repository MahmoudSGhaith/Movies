import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_styles.dart';

class BackCustomCupertinoButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final void Function()? onPress;

  const BackCustomCupertinoButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPress,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: borderColor, width: 3),
      ),
      child: CupertinoButton(
        color: backgroundColor,

        child: Text(text, style: AppStyles.yellow20bold),
        onPressed: onPress,
      ),
    );
  }
}
