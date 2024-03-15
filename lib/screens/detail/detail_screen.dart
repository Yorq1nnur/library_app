import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AppImages.back,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.c06070D,
                    size: 24.w,
                  ),
                ),
                Center(
                  child: Text(
                    "Detail Book",
                    style: AppTextStyle.interMedium.copyWith(fontSize: 20.sp),
                  ),
                ),
                Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.c06070D,
                      size: 24.w,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.c06070D,
                      size: 24.w,
                    ),
                  ),
                ],)
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 360 .h,
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset(AppImages.shelf)),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.network(
                          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347287462i/10440889.jpg",
                          height: 300.h,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 18.h),
                Text(
                  "Shum Bola",
                  style: AppTextStyle.interSemiBold
                      .copyWith(color: AppColors.c0F0F10, fontSize: 16.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  "David Reinfurt",
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.c9D9EA8, fontSize: 13.sp),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  child: Text(
                      '''A New Program for Graphic Design is the first communication-design textbook expressly of and for the 21st century. '''),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}
