import 'package:lib_browser_extensions/lib_browser_extensions.dart';

class SearchRepository {
  static final List<SearchExtension> extensions = [
    LibGenExtension(),
  ];

  static Future<List<BookSearchGroup>> search(String query) async {
    final groups = <BookSearchGroup>[];

    for (var extension in extensions) {
      print('searching on ${extension.runtimeType}');
      final result = await extension.search(query);

      groups.addAll(result);
    }

    return groups;
  }
}
