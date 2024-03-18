import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.linkPicture,
    required this.bookName,
    required this.author,
    required this.onTap,
    required this.categoryName,
    required this.rate,
    required this.price,
  });

  final String linkPicture;
  final String bookName;
  final String author;
  final String rate;
  final String price;
  final String categoryName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: CachedNetworkImage(
                imageUrl: linkPicture,
                height: 200.h,
                width: 135.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              bookName,
              style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.c0F0F10,
                fontSize: 16.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              author,
              style: AppTextStyle.interMedium.copyWith(
                color: AppColors.black.withOpacity(
                  0.8,
                ),
                fontSize: 13.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName,
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black.withOpacity(
                      0.5,
                    ),
                    fontSize: 13.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      rate,
                      style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black.withOpacity(
                          0.5,
                        ),
                        fontSize: 13.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.star,
                      size: 20.w,
                      color: Colors.yellowAccent,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Narxi:",
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black.withOpacity(
                      0.5,
                    ),
                    fontSize: 13.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$price so'm",
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.black.withOpacity(
                      0.5,
                    ),
                    fontSize: 13.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
