import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/protos/book.pb.dart';
import 'package:flutter_grpc_client/providers/books_provider.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  static final String routeName = '/addBook';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final BooksProvider booksProvider =
        Provider.of<BooksProvider>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Add New Book'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildTextFormField(titleController, 'Title'),
            buildTextFormField(authorController, 'Author'),
            buildTextFormField(yearController, 'year',
                type: TextInputType.datetime),
            SizedBox(height: 25),
            RaisedButton(
                child: Text('Add Book'),
                textColor: Colors.white,
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Book book = Book()
                    ..clearId()
                    ..clearTitle()
                    ..title = titleController.text
                    ..clearAuthor()
                    ..author = authorController.text
                    ..clearReleaseYear()
                    ..releaseYear = int.parse(yearController.text);

                  booksProvider.addNewBook(book).then((_) {
                    buildSnackBar();
                    titleController.clear();
                    authorController.clear();
                    yearController.clear();
                  });
                }),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      TextEditingController controller, String title,
      {TextInputType type}) {
    return TextFormField(
      autocorrect: true,
      controller: controller,
      maxLines: 1,
      minLines: 1,
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: title,
        labelText: title,
      ),
      toolbarOptions: ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
    );
  }

  buildSnackBar() {
    scaffoldKey.currentState.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
          content: Text('Book added successfully'),
          backgroundColor: Colors.green),
    );
  }
}
