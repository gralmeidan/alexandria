import 'package:flutter/material.dart';

import '../../../../styles/text.dart';

class LibraryBookCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? coverLabel;
  final ImageProvider cover;
  final String title;
  final String author;
  final TextStyle? titleStyle;

  const LibraryBookCard({
    required this.cover,
    required this.title,
    required this.author,
    this.onTap,
    this.coverLabel,
    this.titleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: cover,
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: double.infinity,
              child: Transform.translate(
                // There is a very annoying visual glitch here.
                // The only way I could fix it is by moving the text
                // a little bit to the bottom.
                //
                // You may not like it but this is what peak performance looks like.
                offset: const Offset(0, 0.2),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [.2, .6, 1],
                      colors: [
                        bgColor.withOpacity(1),
                        bgColor.withOpacity(0.8),
                        bgColor.withOpacity(0),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6).copyWith(top: 16, bottom: 8),
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const AppStyle.titleSmall(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
