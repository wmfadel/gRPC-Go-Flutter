///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'book.pb.dart' as $0;
export 'book.pb.dart';

class BooksServiceClient extends $grpc.Client {
  static final _$getAllBooks = $grpc.ClientMethod<$0.Empty, $0.BookList>(
      '/proto.BooksService/getAllBooks',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BookList.fromBuffer(value));
  static final _$addBook = $grpc.ClientMethod<$0.Book, $0.Book>(
      '/proto.BooksService/addBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$getBook = $grpc.ClientMethod<$0.BookRequest, $0.Book>(
      '/proto.BooksService/getBook',
      ($0.BookRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$updateBook = $grpc.ClientMethod<$0.Book, $0.Book>(
      '/proto.BooksService/updateBook',
      ($0.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Book.fromBuffer(value));
  static final _$deleteBook = $grpc.ClientMethod<$0.BookRequest, $0.Empty>(
      '/proto.BooksService/deleteBook',
      ($0.BookRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  BooksServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.BookList> getAllBooks($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAllBooks, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Book> addBook($0.Book request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addBook, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Book> getBook($0.BookRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getBook, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Book> updateBook($0.Book request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateBook, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> deleteBook($0.BookRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteBook, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class BooksServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.BooksService';

  BooksServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.BookList>(
        'getAllBooks',
        getAllBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.BookList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.Book>(
        'addBook',
        addBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BookRequest, $0.Book>(
        'getBook',
        getBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BookRequest.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Book, $0.Book>(
        'updateBook',
        updateBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Book.fromBuffer(value),
        ($0.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BookRequest, $0.Empty>(
        'deleteBook',
        deleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BookRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.BookList> getAllBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllBooks(call, await request);
  }

  $async.Future<$0.Book> addBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return addBook(call, await request);
  }

  $async.Future<$0.Book> getBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BookRequest> request) async {
    return getBook(call, await request);
  }

  $async.Future<$0.Book> updateBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Book> request) async {
    return updateBook(call, await request);
  }

  $async.Future<$0.Empty> deleteBook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.BookRequest> request) async {
    return deleteBook(call, await request);
  }

  $async.Future<$0.BookList> getAllBooks(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Book> addBook($grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.Book> getBook(
      $grpc.ServiceCall call, $0.BookRequest request);
  $async.Future<$0.Book> updateBook($grpc.ServiceCall call, $0.Book request);
  $async.Future<$0.Empty> deleteBook(
      $grpc.ServiceCall call, $0.BookRequest request);
}
