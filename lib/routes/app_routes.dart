// ignore_for_file: constant_identifier_names
import '../pages/library/library.dart';
import '../pages/search/search.page.dart';

class AppRoutes {
  static const String HOME = '/';
  static const String SEARCH_PAGE = '/search';

  static final routes = {
    HOME: (context) => const HomePage(),
    SEARCH_PAGE: (context) => const SearchPage(),
  };
}
