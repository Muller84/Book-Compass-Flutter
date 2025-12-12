import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// School dataset (class, students)
Future<Map<String, dynamic>> loadSchoolDataset() async {
  final jsonString =
      await rootBundle.loadString('assets/data/school_dataset.json');
  return json.decode(jsonString) as Map<String, dynamic>;
}

// Books dataset 
Future<List<dynamic>> loadBooksDataset() async {
  final jsonString =
      await rootBundle.loadString('assets/data/books.json');
  return json.decode(jsonString) as List<dynamic>;
}

