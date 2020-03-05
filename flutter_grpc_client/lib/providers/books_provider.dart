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
    print(
        'added book\nres type: ${res.runtimeType}\nres data:\n${res.toString()}');
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
      print('error on delete ${e.toString()}');
      return false;
    }
    return true;
  }
}
