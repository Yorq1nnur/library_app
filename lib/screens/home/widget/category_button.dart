import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextButton(
        onPressed:onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
          backgroundColor: AppColors.c06070D,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyle.interSemiBold.copyWith(color: AppColors.cDBDBDE),
        ),
      ),
    );
  }
}
