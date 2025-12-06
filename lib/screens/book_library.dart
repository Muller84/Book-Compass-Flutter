import 'dart:convert';                     // jsonDecode
import 'package:flutter/services.dart' show rootBundle; // assets
import 'package:flutter/material.dart';    // State, Widget
import 'package:book_compass_flutter/models/book.dart'; // Book model


class BookLibrary extends StatefulWidget {
  const BookLibrary ({super.key});

  @override
  State<BookLibrary> createState() => _BookLibraryStateState();
}

class _BookLibraryStateState extends State<BookLibrary>{
  List<Book> allBooks = [];
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    final jsonString = await rootBundle.loadString('assets/data/books.json');
    final List<dynamic> data = jsonDecode(jsonString);
    allBooks = data.map((e) => Book.fromJson(e)).toList();
    setState(() {
      filteredBooks = allBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ListWiew from filteredBooks
    return Scaffold
    (body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
          TextField(
            decoration: InputDecoration(
              labelText: 'Search Books',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (query) {
              final q = query.toLowerCase();
              setState(() {
                filteredBooks = allBooks.where((book) {
                  return book.title.toLowerCase().contains(q) ||
                      book.author.toLowerCase().contains(q);
                }).toList();
              });
            },
          ),

          const SizedBox(height: 16),

          // List of books
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text('${book.author} • Level ${book.level}'),
                );
              },
            ),
          ),
          ],
        ),
      ),
    ),
    );
  }
}




                   