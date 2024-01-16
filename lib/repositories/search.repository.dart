import 'package:lib_browser_extensions/lib_browser_extensions.dart';
import 'package:lib_browser_extensions/models/details.dart';

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

  static Future<BookDetails> details(BookSearchResult result) async {
    final response = await result.extension.details(result);

    return response;
  }
}
