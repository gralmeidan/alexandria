import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

class MirrorsList extends StatelessWidget {
  final List<BookMirror> mirrors;

  const MirrorsList({
    super.key,
    required this.mirrors,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Mirrors',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey.withAlpha(30),
        ),
        for (final mirror in mirrors)
          _AtomMirrorListTile(
            mirror: mirror,
          ),
      ],
    );
  }
}

class _AtomMirrorListTile extends StatelessWidget {
  final BookMirror mirror;

  const _AtomMirrorListTile({
    required this.mirror,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mirror.label,
              style: const TextStyle(
                color: Color.fromARGB(255, 212, 212, 212),
              ),
            ),
            Icon(
              mirror.hasAutodownload ? Icons.download_rounded : Icons.open_in_new_rounded,
              size: 22,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
