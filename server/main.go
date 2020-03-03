package main

import (
	"context"
	"fmt"
	"gRPC-Go-Flutter/proto"
	"net"
	"time"

	"google.golang.org/grpc"
)

// BookService struct
type BookService struct {
	Books []*proto.Book
}

// GetAllBooks func
func (srv *BookService) GetAllBooks(ctx context.Context, empty *proto.Empty) (*proto.BookList, error) {
	bookList := make([]*proto.Book, 0)
	for _, book := range srv.Books {
		bookList = append(bookList, book)
	}
	return &proto.BookList{Books: bookList}, nil
}

// AddBook func
func (srv *BookService) AddBook(stx context.Context, book *proto.Book) (*proto.Book, error) {
	if len(book.Id) < 1 {
		book.Id = time.Now().String()
	}
	srv.Books = append(srv.Books, book)
	return book, nil
}

// GetBook func
func (srv *BookService) GetBook(ctx context.Context, req *proto.BookRequest) (*proto.Book, error) {
	var b *proto.Book
	for _, book := range srv.Books {
		if book.Id == req.GetId() {
			b.Id = book.Id
			b.Title = book.Title
			b.Author = book.Author
			b.ReleaseYear = book.ReleaseYear
			return b, nil
		}
	}
	return b, nil
}

// UpdateBook func
func (srv *BookService) UpdateBook(ctx context.Context, newBook *proto.Book) (*proto.Book, error) {
	for _, book := range srv.Books {
		if book.Id == newBook.Id {
			book.Title = newBook.Title
			book.ReleaseYear = newBook.ReleaseYear
			book.Author = newBook.Author
			return book, nil
		}
	}
	return &proto.Book{}, nil
}

// DeleteBook func
func (srv *BookService) DeleteBook(ctx context.Context, req *proto.BookRequest) (*proto.Empty, error) {
	for index, book := range srv.Books {
		if book.Id == req.Id {
			srv.Books = append(srv.Books[:index], srv.Books[index+1:]...)
			return &proto.Empty{}, nil
		}
	}
	return &proto.Empty{}, nil
}

func main() {
	l, err := net.Listen("tcp", ":8080")
	// handle err
	if err != nil {
		fmt.Println("error creating server")
	}
	server := grpc.NewServer()

	service := proto.BooksServiceServer(&BookService{})
	proto.RegisterBooksServiceServer(server, service)

	err = server.Serve(l)

}
