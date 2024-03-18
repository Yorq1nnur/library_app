import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/screens/home/home_screen.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/variables/variables.dart';
import '../../view_models/book_view_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  List<String> changeData = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> oldBook = [
      widget.booksModel.bookName,
      widget.booksModel.author,
      widget.booksModel.categoryName,
      widget.booksModel.description,
      widget.booksModel.imageUrl,
      widget.booksModel.price.toString(),
      widget.booksModel.rate.toString(),
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Update book",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        oldBook.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: TextField(
                              style: AppTextStyle.interMedium,
                              // controller: controllers[index],
                              textInputAction: index == 6
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              readOnly: false,
                              enabled: true,
                              maxLines: 1,
                              onChanged: (value) {
                                changeData[index] = value;
                              },
                              onSubmitted: (v) {
                                changeData[index] = v;
                                if (kDebugMode) {
                                  print("Current: ${oldBook[index]}");
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: oldBook[index],
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
                          Future.delayed(const Duration(seconds: 3));
                          // for (int i = 0; i < oldBook.length; i++) {
                          //   if (kDebugMode) {
                          //     print(
                          //       "==================================${changeData[i]}\n",
                          //     );
                          //   }
                          // }
                          BooksModel book = BooksModel(
                            bookName: changeData[0] == ''
                                ? widget.booksModel.bookName
                                : changeData[0],
                            author: changeData[1] == ''
                                ? widget.booksModel.author
                                : changeData[1],
                            categoryName: changeData[2] == ''
                                ? widget.booksModel.categoryName
                                : changeData[2],
                            description: changeData[3] == ''
                                ? widget.booksModel.description
                                : changeData[3],
                            imageUrl: changeData[4] == ''
                                ? widget.booksModel.imageUrl
                                : changeData[4],
                            price: int.parse(changeData[5] == ''
                                ? widget.booksModel.price.toString()
                                : changeData[5]),
                            rate: double.parse(changeData[6] == ''
                                ? widget.booksModel.rate.toString()
                                : changeData[6],),
                            uuid: widget.booksModel.uuid,
                          );
                          await context.read<BookViewModel>().updateBook(book);
                          if(context.mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "SUCCESS",
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.lightBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          isUpdated == true;
                          if (context.mounted) {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return const HomeScreen();
                            }));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Text(
                            "SAQLASH",
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}