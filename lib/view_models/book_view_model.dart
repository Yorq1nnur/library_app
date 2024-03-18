import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/data/repositories/book_repo.dart';

class BookViewModel extends ChangeNotifier {
  List<BooksModel> allBooks = [];
  List<BooksModel> categoryBook = [];

  String statusText = "";


  bool isLoading = false;

  BookViewModel({required this.bookRepo}) {
    getAllBooks();
  }

  final BookRepo bookRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await bookRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BooksModel>;
      categoryBook=allBooks;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.addNewBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook({required String bookUUID}) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.deleteBook(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> getCategoriesBook({required String name}) async {
    // _notify(true);
    // MyResponse myResponse = await bookRepo.getAllBooks();
    // _notify(false);
    // if (myResponse.errorText.isEmpty) {
    //   allBooks = myResponse.data as List<BooksModel>;
    // } else {
    //   statusText = myResponse.errorText;
    // }

    if (name.isNotEmpty) {
      if (name != 'All') {
        categoryBook =
            allBooks.where((element) => element.categoryName == name).toList();
        // allBooks = categoryBook;
      }else{
        categoryBook=allBooks;
      }
      notifyListeners();
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
