import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.back,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 2.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20.w,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "Add book",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 8.w,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          child: Image.asset(
                            AppImages.book,
                            height: 30.h,
                            width: 30.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
