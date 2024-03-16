import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/models/variables/variables.dart';
import '../../view_models/book_view_model.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;
  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = [
      bookNameController,
      categoryNameController,
      descriptionController,
      imageUrlController,
      priceController,
      rateController,
      authorController,
    ];

    List<String> oldBook = [
      booksModel.bookName,
      booksModel.author,
      booksModel.categoryName,
      booksModel.description,
      booksModel.imageUrl,
      booksModel.price.toString(),
      booksModel.rate.toString(),
    ];

    List<dynamic> changeData = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
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
                        controllers.length,
                            (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: TextField(
                              controller: controllers[index],
                              textInputAction: index == 6 ? TextInputAction.done : TextInputAction.next,
                              readOnly: false,
                              enabled: true,
                              maxLines: 1,
                              onChanged: (value) {
                                oldBook[index] = value;
                                if (kDebugMode) {
                                  print("Current: ${oldBook[index]}");
                                }
                              },
                              onSubmitted: (v){
                                oldBook[index] = v;
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
                          for (int i = 0; i < controllers.length; i++) {
                            changeData[i] = controllers[i].text;
                            if (kDebugMode) {
                              print(
                                  "==================================${oldBook[i]}\n");
                            }
                          }
                          BooksModel book = BooksModel(
                            bookName: changeData[0],
                            author: changeData[1],
                            categoryName: changeData[2],
                            description: changeData[3],
                            imageUrl: changeData[4],
                            price: int.parse(changeData[5]),
                            rate: double.parse(changeData[6]),
                            uuid: booksModel.uuid,
                          );
                          await context.read<BookViewModel>().updateBook(book);
                          isUpdated == true;
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("SAQLASH"),
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

  void dispose() {
    bookNameController.dispose();
    authorController.dispose();
    categoryNameController.dispose();
    descriptionController.dispose();
    imageUrlController.dispose();
    priceController.dispose();
    rateController.dispose();
  }
}
