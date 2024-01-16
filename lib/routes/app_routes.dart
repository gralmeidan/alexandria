// ignore_for_file: constant_identifier_names
import '../pages/details/details.page.dart';
import '../pages/library/library.dart';
import '../pages/search/search.page.dart';

class AppRoutes {
  static const String HOME = '/';
  static const String SEARCH_PAGE = '/search';
  static const String DETAILS_PAGE = '/details';

  static final routes = {
    HOME: (context) => const HomePage(),
    SEARCH_PAGE: (context) => const SearchPage(),
    DETAILS_PAGE: (context) => const DetailsPage(),
  };
}
