import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lib_browser_extensions/lib_browser_extensions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/configs.dart';
import '../../../styles/text.dart';

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
            style: AppStyle.titleMedium(),
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

  void _showDialog(BuildContext context, [String? title, bool open = true]) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? mirror.label),
          content: SelectableText(mirror.uri.toString()),
          actions: [
            if (open)
              TextButton(
                onPressed: () async {
                  try {
                    await launchUrl(mirror.uri);
                  } catch (e) {
                    if (context.mounted) {
                      _showDialog(context, 'We had a problem opening your link', false);
                    }
                  }
                },
                child: const Text('Open'),
              ),
          ],
        );
      },
    );
  }

  void _handleClick(BuildContext context) async {
    if (!mirror.hasAutodownload) {
      return _showDialog(context);
    }

    await Permission.manageExternalStorage.request();

    try {
      if (!AppConfigs.hasDir) {
        AppConfigs.dir = await FilePicker.platform.getDirectoryPath();
      }

      if (context.mounted) {
        await mirror.download(
          context,
          path: AppConfigs.dir,
        );
      }
    } catch (e) {
      if (context.mounted) {
        _showDialog(context, 'We had a problem downloading this file.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleClick(context),
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
              style: const AppStyle.bodyMedium(
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
