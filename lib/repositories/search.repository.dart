import 'package:lib_browser_extensions/lib_browser_extensions.dart';

class SearchRepository {
  static final List<SearchExtension> extensions = [
    LibGenExtension(),
  ];

  static Future<Map<String, List<BookSearchGroup>>> search(String query) async {
    final groups = <String, List<BookSearchGroup>>{};

    for (var extension in extensions) {
      final result = await extension.search(query);

      groups[extension.name] = result;
    }

    return groups;
  }
}
