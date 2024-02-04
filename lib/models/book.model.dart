// import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';

class Book {
  String? title;
  String? author;
  String? path;
  ImageProvider? cover;

  Book({
    required this.title,
    required this.author,
    required this.path,
    required this.cover,
  });
}
