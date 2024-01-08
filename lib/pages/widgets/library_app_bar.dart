import 'package:flutter/material.dart';

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

  void _toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget title;
    Widget? leading;

    if (_isSearchOpen) {
      title = TextField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
        controller: _searchController,
      );

      leading = IconButton(
        onPressed: () {
          _toggleSearch();
        },
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
            _toggleSearch();
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
