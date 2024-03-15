
import 'package:library_app/data/models/my_response.dart';
import 'package:library_app/data/models/books_model.dart';
import 'package:library_app/data/network/api_provider.dart';

class BookRepo {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addNewBook(BooksModel productModel) =>
      ApiProvider.addNewBook(productModel);

  Future<MyResponse> deleteBook(String productUUID) =>
      ApiProvider.deleteBook(productUUID);

  Future<MyResponse> updateBook(BooksModel productModel) =>
      ApiProvider.updateBook(productModel);
}
