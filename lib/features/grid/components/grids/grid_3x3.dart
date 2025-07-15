import '../grid_item.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import '/imports.dart';

class Grid3x3 extends StatefulWidget {
  final GlobalKey globalKey;

  const Grid3x3({
    super.key,
    required this.globalKey,
  });

  @override
  State<Grid3x3> createState() => _Grid3x3State();
}

class _Grid3x3State extends State<Grid3x3> with SharedState {
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
              width: 350,
              height: 450,
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
                        GridItem(
                          imageIndex: 5,
                          imagePath: gridImagesState.image5,
                          radius: radius,
                        ),
                        GridItem(
                          imageIndex: 6,
                          imagePath: gridImagesState.image6,
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
                          imageIndex: 7,
                          imagePath: gridImagesState.image7,
                          radius: radius,
                        ),
                        GridItem(
                          imageIndex: 8,
                          imagePath: gridImagesState.image8,
                          radius: radius,
                        ),
                        GridItem(
                          imageIndex: 9,
                          imagePath: gridImagesState.image9,
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
