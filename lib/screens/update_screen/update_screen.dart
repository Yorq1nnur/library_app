import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/screens/update_screen/widgets/text_field.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../view_models/book_view_model.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({
    super.key,
    required this.booksModel,
  });

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    final TextEditingController bookNameController = TextEditingController();
    final TextEditingController categoryNameController =
        TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController authorController = TextEditingController();

    final List<TextEditingController> controllers = [
      bookNameController,
      categoryNameController,
      descriptionController,
      imageUrlController,
      priceController,
      rateController,
      authorController,
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
                        titles.length,
                        (index) => TextFieldItem(
                          labelText: titles[index],
                          hintText: titles[index],
                          controller: controllers[index],
                          booksModel: booksModel,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ZoomTapAnimation(
                        onTap: () async {
                          Future.delayed(const Duration(seconds: 3));
                          for (int i = 0; i < titles.length; i++) {
                            changeData[i] = controllers[i].text;
                            print(
                                "==================================${changeData[i]}\n");
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
                          if(context.mounted){
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
