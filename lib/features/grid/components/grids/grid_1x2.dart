import '../grid_item.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import '/imports.dart';

class Grid1x2 extends StatefulWidget {
  final GlobalKey globalKey;
  const Grid1x2({super.key, required this.globalKey});

  @override
  State<Grid1x2> createState() => _Grid1x2State();
}

class _Grid1x2State extends State<Grid1x2> with SharedState {
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
