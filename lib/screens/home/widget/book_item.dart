import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';



class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.linkPicture, required this.bookName, required this.author, required this.onTap});
  final String linkPicture;
  final  String bookName;
  final String author;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return  ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.network(
                  linkPicture,
                  height: 200.h,
                  width: 135.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                bookName,
                style: AppTextStyle.interSemiBold
                    .copyWith(color: AppColors.c0F0F10, fontSize: 16.sp),
              ),
              SizedBox(height: 6.h),
              Text(
                author,
                style: AppTextStyle.interMedium
                    .copyWith(color: AppColors.c9D9EA8, fontSize: 13.sp),
              ),
            ],
          ),
      ),
    );
  }
}
