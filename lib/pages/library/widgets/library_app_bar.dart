import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../stores/stores.dart';

class LibraryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const LibraryAppBar({
    Key? key,
    this.title = 'Title',
  }) : super(key: key);

  @override
  State<LibraryAppBar> createState() => _LibraryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LibraryAppBarState extends State<LibraryAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchOpen = false;

  void _setSearch(bool value) {
    setState(() {
      _isSearchOpen = value;
    });
  }

  void _closeSearch() {
    _setSearch(false);
    _searchController.clear();
    context.query.updateSearch('');
  }

  @override
  Widget build(BuildContext context) {
    late Widget title;
    Widget? leading;

    if (_isSearchOpen) {
      title = SearchInput(
        controller: _searchController,
        onChanged: (value) {
          context.query.updateSearch(value);
        },
        onSubmitted: (value) {
          context.search.openSearch();
        },
      );

      leading = IconButton(
        onPressed: _closeSearch,
        icon: const Icon(Icons.arrow_back),
      );
    } else {
      title = Text(widget.title);
    }

    return AppBar(
      title: title,
      leading: leading,
      actions: [
        IconButton(
          onPressed: () {
            _setSearch(true);
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
