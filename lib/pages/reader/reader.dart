import 'dart:typed_data';

import 'package:epubx/epubx.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class ReaderPage extends StatelessWidget {
  final EpubBook book;

  ReaderPage({super.key, required this.book});

  List<Widget> get _bookContent {
    final result = <Widget>[];
    final chapters = book.Chapters ?? [];

    for (var chapter in chapters) {
      if (chapter.HtmlContent == null) {
        continue;
      }

      final doc = dom.Document.html(chapter.HtmlContent!);
      final body = doc.querySelector('body');

      if (body == null || body.children.isEmpty) {
        continue;
      }

      result.add(
        SliverList.builder(
          itemCount: body.children.length,
          itemBuilder: (_, index) {
            final element = body.children[index];

            if (element.localName == 'p') {
              String content = element.innerHtml;

              if (element.className.isNotEmpty) {
                content = 'class: ${element.className}; ${element.innerHtml}';
              }

              content = content.replaceAll(r'&nbsp;', '');

              if (content.isEmpty) {
                return const SizedBox();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                ),
              );
            }

            if (element.localName == 'img') {
              final url = element.attributes['src']!.replaceAll('../', '');
              final content = Uint8List.fromList(book.Content!.Images![url]!.Content!);
              return Image(
                image: MemoryImage(content),
              );
            }

            return Text(
              'tag: ${element.localName}; ${element.innerHtml}',
              textAlign: TextAlign.justify,
            );
          },
        ),
      );
    }

    return result;
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reader'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            ..._bookContent,
          ],
        ),
      ),
    );
  }
}
