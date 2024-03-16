import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/categories/categories.dart';
import 'package:library_app/screens/detail/detail_screen.dart';
import 'package:library_app/screens/home/widget/book_item.dart';
import 'package:library_app/screens/home/widget/category_button.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/styles/app_text_style.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';
import '../../utils/images/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                child: Image.asset(
                  AppImages.library,
                  height: 50.h,
                  width: 50.h,
                  fit: BoxFit.contain,
                )),
          ),
          title: Text(
            "My Library",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.c06070D,
              fontSize: 24.sp,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: AppColors.c06070D,
                size: 24.w,
              ),
            ),
          ],
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
                child: Stack(
                  children: [
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
                              ...List.generate(
                                categories.length,
                                (index) => CategoryButton(
                                  title: categories[index],
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 10.h),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Search',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 40.h,
                            ),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.45,
                            children: [
                              ...context
                                  .watch<BookViewModel>()
                                  .allBooks
                                  .where((book) => book.bookName
                                      .toLowerCase()
                                      .contains(searchText.toLowerCase()))
                                  .map(
                                    (book) => BookItem(
                                      linkPicture: book.imageUrl,
                                      bookName: book.bookName,
                                      author: book.author,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              booksModel: book,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
