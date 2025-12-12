import 'dart:convert'; // jsonDecode
import 'package:book_compass_flutter/theme/app_theme.dart';
import 'package:flutter/services.dart' show rootBundle; // assets
import 'package:flutter/material.dart'; // State, Widget
import 'package:book_compass_flutter/models/book.dart'; // Book model
import 'package:book_compass_flutter/widgets/app_bottom_nav_bar.dart';

class BookLibrary extends StatefulWidget {
  final Map<String, dynamic>? schoolClasses;
  const BookLibrary({super.key, this.schoolClasses});

  @override
  State<BookLibrary> createState() => _BookLibraryStateState();
}

class _BookLibraryStateState extends State<BookLibrary> {
  // Complete list of books loaded from JSON file (application source data)
  List<Book> allBooks = []; 

  // Currently filtered list of books based on user search
  List<Book> filteredBooks = []; 

  @override
  void initState() { 
    super.initState();
    // When initializing the screen, load books from assets
    loadBooks();
  }

  Future<void> loadBooks() async {
    // Load the JSON file with books from assets
    final jsonString = await rootBundle.loadString('assets/data/books.json');
    final List<dynamic> data = jsonDecode(jsonString);
    // Convert JSON objects to Book model instance
    allBooks = data.map((e) => Book.fromJson(e)).toList();
    // Set initial state - show all books
    setState(() {
      filteredBooks = allBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;  // apply global text styles

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // Top row with application logo
                children: [Image.asset(
                'assets/images/logo.png',
                height: kLogoHeight,
                ),
                const Spacer(),
                ],
                ),

              const SizedBox(height: kSpacingMedium),

              // Screen title
              Center(
                child: Text(
                  'Book Library',
                  style: textTheme.titleLarge,
                ),
              ),

              const SizedBox(height: kSpacingMedium),

              // Search field to filter books by title or author
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

              // Dynamic book list – responds to searches
              Expanded(
                child: ListView.separated(
                  itemCount: filteredBooks.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final book = filteredBooks[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: kPrimaryColor.withValues(alpha: 0.1),
                          child: Text(
                            book.author.isNotEmpty
                              ? book.author.characters.first.toUpperCase() 
                              : '?',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(book.title),
                        subtitle: Text(
                          '${book.author} • Level ${book.level} • ${book.category}',
                          ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () { // TODO book's detail
          },
        ),
      );
    },
  ),
),
            ],
          ),
        ),
      ),
      
      // Application bottom navigation bar
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: 2,
        schoolClasses: widget.schoolClasses,
      ),
    );
  }
}
