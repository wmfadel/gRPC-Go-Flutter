import 'package:flutter/foundation.dart';
import 'package:flutter_grpc_client/protos/book.pb.dart';
import 'package:flutter_grpc_client/protos/book.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class BooksProvider with ChangeNotifier {
  BooksServiceClient client;
  List<Book> allBooks = [];

  BooksProvider() {
    client = BooksServiceClient(
      ClientChannel(
        '192.168.1.3',
        port: 8080,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ),
      ),
    );
  }

  Future<Book> addNewBook(Book newBook) async {
    Book res = await client.addBook(newBook);
    allBooks.add(res);
    notifyListeners();
    return res;
  }

  Future<dynamic> fetchAllBooks() async {
    BookList books = await client.getAllBooks(Empty());
    allBooks = books.books;
    return true;
  }

  Future<bool> deleteBook(String id) async {
    try {
      allBooks.removeWhere((element) => element.id == id);
      await client.deleteBook(
        BookRequest()
          ..clearId()
          ..id = id,
      );
    } on Exception catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> updateBook(Book book) async {
    Book updatedBook = await client.updateBook(book);
    if (updatedBook != null) {
      int index = allBooks.indexWhere((element) => element.id == book.id);
      allBooks[index] = updatedBook;
      notifyListeners();
      return true;
    }
    return false;
  }

  Book getBookById(String id) {
    return allBooks.firstWhere((element) => element.id == id, orElse: null);
  }
}
