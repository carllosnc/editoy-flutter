import 'dart:io';
import '/imports.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final double height;
  final double radius;
  final String? imagePath;
  final int imageIndex;

  const GridItem({
    super.key,
    required this.height,
    required this.radius,
    required this.imagePath,
    required this.imageIndex,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> with SharedState {
  Widget getImagePath() {
    if (widget.imagePath == null) {
      return Image.asset(
        "assets/images/grids/grid_item_placeholder.png",
        fit: gridSettingsState.boxFit,
      );
    }

    return Image.file(
      File(widget.imagePath!),
      fit: gridSettingsState.boxFit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: widget.height,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.red.withValues(alpha: 0.3),
            onTap: () async {
              await gridImagesState.setImage(widget.imageIndex);
            },
            child: InteractiveViewer(
              child: getImagePath(),
            ),
          ),
        ),
      ),
    );
  }
}
