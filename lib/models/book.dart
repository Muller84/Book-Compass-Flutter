class Book {
  final String id;
  final String title;
  final String author;
  final int level;
  final String category;
  final List<String> tags;
  final String description;
  final double rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.level,
    required this.category,
    required this.tags,
    required this.description,
    required this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      level: json['level'] as int,
      category: json['category'] as String,
      tags: List<String>.from(json['tags'] as List),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
