// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

final BookRepo bookRepo = BookRepo();
final List<String> imagesPath = [];

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: context.watch<BookViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<BookViewModel>().getAllBooks();
                    },
                  );
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      context.watch<BookViewModel>().allBooks.length,
                      (index) {
                        imagesPath.addAll(
                          context.watch<BookViewModel>().allBooks[index].images,
                        );
                        BooksModel first =
                            context.watch<BookViewModel>().allBooks[index];
                        return ListTile(
                          title: Text(first.bookName),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
