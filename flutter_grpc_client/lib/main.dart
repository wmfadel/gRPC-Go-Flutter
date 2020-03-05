import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/pages/add_book_page.dart';
import 'package:flutter_grpc_client/pages/home_page.dart';
import 'package:flutter_grpc_client/providers/books_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: MaterialApp(
        title: 'Flutter gRPC Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          AddBookPage.routeName: (context) => AddBookPage(),
        },
      ),
    );
  }
}
