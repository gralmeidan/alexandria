import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';

class MinorDetails extends StatelessWidget {
  final BookDetails details;

  const MinorDetails({
    required this.details,
    Key? key,
  }) : super(key: key);

  static const _divider = Padding(
    padding: EdgeInsets.symmetric(horizontal: 18),
    child: SizedBox(
      width: 1.5,
      height: 22,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _AtomWithLabel(
          Text(details.language),
          label: 'Language',
        ),
        _divider,
        _AtomWithLabel(
          const Icon(Icons.file_download_outlined),
          label: '${details.filetype} (${details.filesize})',
        ),
        _divider,
        _AtomWithLabel(
          Text(details.pages),
          label: 'Pages',
        ),
      ],
    );
  }
}

class _AtomWithLabel extends StatelessWidget {
  final Widget child;
  final String label;

  const _AtomWithLabel(
    this.child, {
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
