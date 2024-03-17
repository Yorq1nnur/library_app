import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/screens/update_screen/update_screen.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import '../../data/models/variables/variables.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;

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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                          style: AppTextStyle.interMedium.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateScreen(
                                    booksModel: booksModel,
                                  ),
                                ),
                              );
                              isUpdated = false;
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 24.w,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.white,
                                    title: const Text("Ishonchingiz komilmi?"),
                                    titleTextStyle:
                                        AppTextStyle.interBold.copyWith(
                                      color: AppColors.black,
                                      fontSize: 20.sp,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          context
                                              .read<BookViewModel>()
                                              .deleteBook(
                                                bookUUID: booksModel.uuid!,
                                              );
                                          Future.delayed(
                                            const Duration(seconds: 1),
                                          );
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "SUCCESS",
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Yes',
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'No',
                                          style: AppTextStyle.interBold
                                              .copyWith(color: AppColors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 24.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 360.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SvgPicture.asset(
                                  AppImages.shelf,
                                ),
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.r),
                                  child: Image.network(
                                    booksModel.imageUrl,
                                    height: 300.h,
                                    width: 200.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Kitob nomi:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c0F0F10,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          booksModel.bookName,
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c0F0F10.withOpacity(
                              0.5,
                            ),
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Kitob muallifi:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c0F0F10,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          booksModel.author,
                          style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c9D9EA8,
                            fontSize: 13.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Izoh:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c0F0F10,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          booksModel.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.c9D9EA8,
                            fontSize: 13.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kitob reytingi:",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.c0F0F10,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    booksModel.rate.toString(),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.c9D9EA8,
                                      fontSize: 13.sp,
                                    ),
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
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kitob narxi:",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.c0F0F10,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${booksModel.price} so'm",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.c9D9EA8,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
