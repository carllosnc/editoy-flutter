import '../grid_item.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import '/imports.dart';

class GridW extends StatefulWidget {
  final GlobalKey globalKey;

  const GridW({
    super.key,
    required this.globalKey,
  });

  @override
  State<GridW> createState() => _GridWState();
}

class _GridWState extends State<GridW> with SharedState {
  @override
  Widget build(BuildContext context) {
    const double radius = 10;

    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 0,
      ),
      color: fabricConfig.color.shade800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: widget.globalKey,
            child: Container(
              width: gridSettingsState.width,
              height: gridSettingsState.height,
              padding: EdgeInsets.all(gridSettingsState.spacing),
              decoration: BoxDecoration(
                color: gridSettingsState.color,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                spacing: gridSettingsState.spacing,
                children: [
                  Flexible(
                    child: Row(
                      spacing: gridSettingsState.spacing,
                      children: [
                        GridItem(
                          imageIndex: 1,
                          imagePath: gridImagesState.image1,
                          radius: radius,
                        ),
                        GridItem(
                          imageIndex: 2,
                          imagePath: gridImagesState.image2,
                          radius: radius,
                        ),
                        GridItem(
                          imageIndex: 3,
                          imagePath: gridImagesState.image3,
                          radius: radius,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      spacing: gridSettingsState.spacing,
                      children: [
                        GridItem(
                          imageIndex: 4,
                          imagePath: gridImagesState.image4,
                          radius: radius,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
