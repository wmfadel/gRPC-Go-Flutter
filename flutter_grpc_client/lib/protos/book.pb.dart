///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Book extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Book', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'Id', protoName: 'Id')
    ..aOS(2, 'title')
    ..aOS(3, 'author')
    ..a<$core.int>(4, 'releaseYear', $pb.PbFieldType.O3, protoName: 'releaseYear')
    ..hasRequiredFields = false
  ;

  Book._() : super();
  factory Book() => create();
  factory Book.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Book.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Book clone() => Book()..mergeFromMessage(this);
  Book copyWith(void Function(Book) updates) => super.copyWith((message) => updates(message as Book));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Book create() => Book._();
  Book createEmptyInstance() => create();
  static $pb.PbList<Book> createRepeated() => $pb.PbList<Book>();
  @$core.pragma('dart2js:noInline')
  static Book getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Book>(create);
  static Book _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get author => $_getSZ(2);
  @$pb.TagNumber(3)
  set author($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthor() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthor() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get releaseYear => $_getIZ(3);
  @$pb.TagNumber(4)
  set releaseYear($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReleaseYear() => $_has(3);
  @$pb.TagNumber(4)
  void clearReleaseYear() => clearField(4);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class BookRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BookRequest', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  BookRequest._() : super();
  factory BookRequest() => create();
  factory BookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BookRequest clone() => BookRequest()..mergeFromMessage(this);
  BookRequest copyWith(void Function(BookRequest) updates) => super.copyWith((message) => updates(message as BookRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BookRequest create() => BookRequest._();
  BookRequest createEmptyInstance() => create();
  static $pb.PbList<BookRequest> createRepeated() => $pb.PbList<BookRequest>();
  @$core.pragma('dart2js:noInline')
  static BookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookRequest>(create);
  static BookRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class BookList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BookList', package: const $pb.PackageName('proto'), createEmptyInstance: create)
    ..pc<Book>(1, 'books', $pb.PbFieldType.PM, subBuilder: Book.create)
    ..hasRequiredFields = false
  ;

  BookList._() : super();
  factory BookList() => create();
  factory BookList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BookList clone() => BookList()..mergeFromMessage(this);
  BookList copyWith(void Function(BookList) updates) => super.copyWith((message) => updates(message as BookList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BookList create() => BookList._();
  BookList createEmptyInstance() => create();
  static $pb.PbList<BookList> createRepeated() => $pb.PbList<BookList>();
  @$core.pragma('dart2js:noInline')
  static BookList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookList>(create);
  static BookList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Book> get books => $_getList(0);
}

