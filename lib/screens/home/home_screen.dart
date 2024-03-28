import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/data/models/categories/categories.dart';
import 'package:library_app/screens/add_book/add_book_screen.dart';
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
  String name = 'All';
  int activeIndex = 0;

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
          leading: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              child: Image.asset(
                AppImages.amiriy,
                height: 30.h,
                width: 30.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(
            "AMIRIY KUTUBXONASI",
            style: AppTextStyle.interBold
                .copyWith(color: AppColors.black, fontSize: 16.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBookScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: AppColors.c06070D,
                size: 24.w,
              ),
            ),
          ],
        ),
        body: context.watch<BookViewModel>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(
                      seconds: 2,
                    ),
                    () {
                      Provider.of<BookViewModel>(context, listen: false);
                      context
                          .read<BookViewModel>()
                          .getCategoriesBook(name: name);
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
                                (index) {
                                  return CategoryButton(
                                    isActive: activeIndex == index,
                                    title: categories[index],
                                    onTap: () {
                                      activeIndex = index;
                                      name = categories[index];
                                      context
                                          .read<BookViewModel>()
                                          .getCategoriesBook(
                                            name: name,
                                          );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: 10.h,
                            bottom: 5.h,
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(
                                () {
                                  searchText = value;
                                },
                              );
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.amberAccent,
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 1.w,
                                ),
                              ),
                              labelText: 'Search',
                              labelStyle: AppTextStyle.interBold.copyWith(
                                color: AppColors.black,
                                fontSize: 20.sp,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.45,
                            children: [
                              ...context
                                  .watch<BookViewModel>()
                                  .categoryBook
                                  .where(
                                    (book) =>
                                        book.bookName.toLowerCase().contains(
                                              searchText.toLowerCase(),
                                            ),
                                  )
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
                                      categoryName: book.categoryName,
                                      rate: book.rate.toString(),
                                      price: book.price.toString(),
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
