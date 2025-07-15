import 'dart:io';
import '/imports.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final double radius;
  final String? imagePath;
  final int imageIndex;

  const GridItem({
    super.key,
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
      return Image(
        image: const AssetImage(
          "assets/images/grids/grid_item_placeholder.png",
        ),
        fit: gridSettingsState.boxFit,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return Image(
      image: FileImage(File(widget.imagePath!)),
      fit: gridSettingsState.boxFit,
      width: double.infinity,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
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
            child: Center(
              child: InteractiveViewer(
                child: getImagePath(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
