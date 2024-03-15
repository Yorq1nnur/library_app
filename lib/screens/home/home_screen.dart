import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/screens/detail/detail_screen.dart';
import 'package:library_app/screens/home/widget/book_item.dart';
import 'package:library_app/screens/home/widget/category_button.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';

import '../../utils/images/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Library",
          style: AppTextStyle.interBold
              .copyWith(color: AppColors.c06070D, fontSize: 24.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: AppColors.c06070D,
                size: 24.w,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: AppColors.c06070D,
                size: 24.w,
              )),
        ],
      ),
      body: Stack(children: [
        Image.asset(
          AppImages.back,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryButton(title: "Category", onTap: () {}),
                  CategoryButton(title: "Category", onTap: () {}),
                  CategoryButton(title: "Category", onTap: () {}),
                  CategoryButton(title: "Category", onTap: () {}),
                ],
              ),
            ),
            // ListView(children: [
            //
            // ],)
            SizedBox(height: 30.h),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                children: [
                  BookItem(
                    linkPicture:
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347287462i/10440889.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetailScreen();
                      }));
                    },
                  ),
                  BookItem(
                    linkPicture:
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387399626i/18465657.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {},
                  ),
                  BookItem(
                    linkPicture:
                        "https://m.media-amazon.com/images/I/51FyvJqf29L.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {},
                  ),
                  BookItem(
                    linkPicture:
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347287462i/10440889.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {},
                  ),
                  BookItem(
                    linkPicture:
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347287462i/10440889.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {},
                  ),
                  BookItem(
                    linkPicture:
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347287462i/10440889.jpg",
                    bookName: "Shum bola",
                    author: "Gafur Gulom",
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
