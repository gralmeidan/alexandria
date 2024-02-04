import 'dart:io';
import 'dart:typed_data';

import 'package:epubx/epubx.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/configs.dart';
import '../../models/book.model.dart';

export 'bookshelf.store.dart';

class BookshelfCubit extends Cubit<BookshelfState> {
  BookshelfCubit() : super(BookshelfState()) {
    refresh();
  }

  Future<ImageProvider?> _getCover(String bookFileName, EpubBook bookRef) async {
    var metaItems = bookRef.Schema!.Package!.Metadata!.MetaItems;
    if (metaItems == null || metaItems.isEmpty) return null;

    var coverMetaItem = metaItems.firstWhere(
      (metaItem) => metaItem.Name != null && metaItem.Name!.toLowerCase() == 'cover',
    );
    if (coverMetaItem.Content == null || coverMetaItem.Content!.isEmpty) {
      throw Exception('Incorrect EPUB metadata: cover item content is missing.');
    }

    var coverManifestItem = bookRef.Schema!.Package!.Manifest!.Items!.firstWhere(
      (EpubManifestItem manifestItem) =>
          manifestItem.Id!.toLowerCase() == coverMetaItem.Content!.toLowerCase(),
    );

    EpubByteContentFile? coverImageContentFileRef;
    if (!bookRef.Content!.Images!.containsKey(coverManifestItem.Href)) {
      throw Exception(
        'Incorrect EPUB manifest: item with href = \"${coverManifestItem.Href}\" is missing.',
      );
    }

    coverImageContentFileRef = bookRef.Content!.Images![coverManifestItem.Href];

    var coverImageContent = coverImageContentFileRef!.Content;

    return MemoryImage(Uint8List.fromList(coverImageContent!));
  }

  Future<List<Book>> _getBooks() async {
    final dir = Directory(AppConfigs.dir);
    final List<Future<Book>> books = [];

    for (var fileEntity in dir.listSync()) {
      if (fileEntity.path.endsWith('.epub')) {
        final file = File(fileEntity.path);

        books.add(
          EpubReader.readBook(file.readAsBytesSync()).then((epub) async {
            return Book(
              title: epub.Title,
              author: epub.Author,
              path: fileEntity.path,
              cover: await _getCover(file.path, epub),
            );
          }),
        );
      }
    }

    return await Future.wait(books);
  }

  void refresh() async {
    emit(BookshelfState(books: await _getBooks()));
  }

  static BlocProvider<BookshelfCubit> provider({
    Key? key,
    Widget? child,
  }) {
    return BlocProvider<BookshelfCubit>(
      key: key,
      create: (context) => BookshelfCubit(),
      child: child,
    );
  }
}

class BookshelfState {
  final List<Book> books;

  BookshelfState({
    this.books = const [],
  });
}

extension BookshelfContext on BuildContext {
  BookshelfCubit get shelf => read<BookshelfCubit>();
}
