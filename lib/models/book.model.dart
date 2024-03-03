// import 'package:epubx/epubx.dart';
import 'package:epubx/epubx.dart';
import 'package:flutter/material.dart';

class Book {
  EpubBook? content;
  String? title;
  String? author;
  String? path;
  ImageProvider? cover;

  Book({
    this.content,
    required this.title,
    required this.author,
    required this.path,
    required this.cover,
  });
}
