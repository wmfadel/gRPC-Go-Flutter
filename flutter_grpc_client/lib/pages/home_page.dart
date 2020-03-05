import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/pages/add_book_page.dart';
import 'package:flutter_grpc_client/protos/book.pb.dart';
import 'package:flutter_grpc_client/providers/books_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BooksProvider booksProvider;
  Future<dynamic> booksFuture;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (booksProvider == null) {
      booksProvider = Provider.of<BooksProvider>(context);
      booksFuture = booksProvider.fetchAllBooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Books gRPC'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddBookPage.routeName);
              }),
        ],
      ),
      body: Center(
          child: FutureBuilder<dynamic>(
        future: booksFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('error fetching movies'));
          if (snapshot.hasData) {
            if (booksProvider.allBooks.length > 1) {
              return ListView.builder(
                itemCount: booksProvider.allBooks.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildListItem(booksProvider.allBooks[index]);
                },
              );
            } else {
              return Center(child: Text('No book available'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }

  Widget buildListItem(Book book) {
    return Dismissible(
      key: Key(book.id),
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      onDismissed: (_) async {
        bool result = await booksProvider.deleteBook(book.id);
        buildSnackBar(result);
      },
      child: ListTile(
        onTap: () => Navigator.of(context)
            .pushNamed(AddBookPage.routeName, arguments: <String, dynamic>{
          'update': true,
          'id': book.id,
        }),
        title: Text(book.title),
        subtitle: Text(book.author),
        trailing: Text(book.releaseYear.toString()),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: Text(getRange(book.id), style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  String getRange(String text) {
    return text.substring(text.length - 4, text.length - 1);
  }

  buildSnackBar(bool status) {
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content:
            Text(status ? 'Book deleted successfully' : 'Failed deleting book'),
        backgroundColor: status ? Colors.green : Colors.red,
      ),
    );
  }
}
