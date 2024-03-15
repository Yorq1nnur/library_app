// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

final BookRepo bookRepo = BookRepo();

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HOMEWORK",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: FutureBuilder<MyResponse>(
          future: bookRepo.getAllBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.hasData) {
              List<BooksModel> books =
              (snapshot.data as MyResponse).data as List<BooksModel>;
              return ListView(
                children: [
                  ...List.generate(books.length, (index) {
                    var book = books[index];
                    return ListTile(
                      title: Text(book.bookName),
                    );
                  })

                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      ),
    );
  }
}