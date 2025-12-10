import 'dart:convert'; // jsonDecode
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:flutter/services.dart' show rootBundle; // assets
import 'package:flutter/material.dart'; // State, Widget
import 'package:book_compass_flutter/models/book.dart'; // Book model
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';

class BookLibrary extends StatefulWidget {
  const BookLibrary({super.key});

  @override
  State<BookLibrary> createState() => _BookLibraryStateState();
}

class _BookLibraryStateState extends State<BookLibrary> {
  List<Book> allBooks = []; // all books from JSON
  List<Book> filteredBooks = []; // filtered books for search
  // ignore: unused_field
  final int _currentIndex = 2; // 0 = Dashboard, 1 = Students, 2 = Library, 3 = Feedback

  @override
  void initState() { // initialize state
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
    final textTheme = Theme.of(context).textTheme;  // get text from global theme

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [Image.asset(
                'assets/images/logo.png',
                height: kLogoHeight,
                ),
                const Spacer(),
                ],
                ),

              const SizedBox(height: kSpacingMedium),

              Center(
                child: Text(
                  'Book Library',
                  style: textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: kSpacingMedium),

              // Search bar
              TextField(
                decoration: InputDecoration( // search input decoration
                  labelText: 'Search Books',
                  prefixIcon: const Icon(Icons.search), // search icon
                  filled: true,
                  fillColor: Colors.grey[200], // light grey background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // rounded corners
                    borderSide: BorderSide.none,
                  ),
                ),
                
                onChanged: (query) { // filter books on search
                  final q = query.toLowerCase(); // lowercase query
                  setState(() {
                    filteredBooks = allBooks.where((book) { // all books
                      return book.title.toLowerCase().contains(q) ||
                          book.author.toLowerCase().contains(q); // return books matching query
                    }).toList(); // convert to list
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
      // Bottom navigation bar
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }
}
