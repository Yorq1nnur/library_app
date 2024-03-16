import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../view_models/book_view_model.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({
    super.key,
  });

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

List<String> newBook = [
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];

bool isValid = true;

class _AddBookScreenState extends State<AddBookScreen> {
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
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...List.generate(
                          titles.length,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 20.w,
                              ),
                              child: TextField(
                                // controller: controllers[index],
                                textInputAction: index == 6
                                    ? TextInputAction.done
                                    : TextInputAction.next,
                                readOnly: false,
                                enabled: true,
                                maxLines: 1,
                                onChanged: (value) {
                                  newBook[index] = value;
                                },
                                onSubmitted: (v) {
                                  newBook[index] = v;
                                  if (kDebugMode) {
                                    print("Current: ${newBook[index]}");
                                  }
                                },
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: titles[index],
                                  hintStyle: AppTextStyle.interMedium,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ZoomTapAnimation(
                          onTap: () async {
                            Future.delayed(
                              const Duration(
                                seconds: 3,
                              ),
                            );
                            for (int i = 0; i < titles.length; i++) {
                              if (newBook[i].isEmpty) {
                                isValid = false;
                              }else{
                                isValid = true;
                              }
                              if (kDebugMode) {
                                print(
                                  "==================================${newBook[i]}\n",
                                );
                              }
                            }

                               if(isValid == true){
                                 BooksModel book = BooksModel(
                                   bookName: newBook[0],
                                   author: newBook[1],
                                   categoryName: newBook[2],
                                   description: newBook[3],
                                   imageUrl: newBook[4],
                                   price: int.parse(newBook[5]),
                                   rate: double.parse(newBook[6]),
                                 );
                                 await context
                                     .read<BookViewModel>()
                                     .addBook(book);
                               }else{
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                     content: Text(
                                       "You didn't fill in some line!!!",
                                     ),
                                   ),
                                 );
                               }
                            if (context.mounted) {
                              isValid ? Navigator.pop(context) : null;
                            }
                          },
                          child: const Text(
                            "SAQLASH",
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<String> titles = [
  "Kitob nomi",
  "Muallifi",
  "Kategoriya nomi",
  "Izoh",
  "Rasm linki",
  "Narxi",
  "Bahosi",
];
