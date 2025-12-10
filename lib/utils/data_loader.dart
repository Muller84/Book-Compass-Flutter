import 'dart:convert'; // Imports a library for working with JSON (decoding text into Dart objects)
import 'package:flutter/services.dart' show rootBundle; // Imports rootBundle, which allows you to load files from the assets folder

// Asynchronous function that loads a dataset of school classes from a JSON file
Future<Map<String, dynamic>> loadSchoolDataset() async {
  // Loads the contents of the school dataset.json file as a text string
  final jsonString = await rootBundle.loadString('assets/data/school_dataset.json');
  // Converts text JSON to a Dart Map (key–value structure) and returns it
  return json.decode(jsonString);
}