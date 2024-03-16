import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/utils/colors/app_colors.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.booksModel,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    String change = "";

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: TextField(
        focusNode: FocusNode(),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16.r,
            ),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
