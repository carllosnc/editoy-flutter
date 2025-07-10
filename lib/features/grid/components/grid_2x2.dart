import '../components/grid_item.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';

class Grid2x2 extends StatefulWidget {
  const Grid2x2({super.key});

  @override
  State<Grid2x2> createState() => _Grid2x2State();
}

class _Grid2x2State extends State<Grid2x2> {
  @override
  Widget build(BuildContext context) {
    const double spacing = 5;
    const double height = 220;
    const double radius = 10;

    return Container(
      padding: const EdgeInsets.all(10),
      color: fabricConfig.color.shade800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(spacing),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: const Column(
              spacing: spacing,
              children: [
                Row(
                  spacing: spacing,
                  children: [
                    GridItem(
                      imagePath: "https://picsum.photos/id/237/600/600",
                      height: height,
                      radius: radius,
                    ),
                    GridItem(
                      imagePath: "https://picsum.photos/id/200/600/600",
                      height: height,
                      radius: radius,
                    ),
                  ],
                ),
                Row(
                  spacing: spacing,
                  children: [
                    GridItem(
                      imagePath: "https://picsum.photos/id/100/600/600",
                      height: height,
                      radius: radius,
                    ),
                    GridItem(
                      imagePath: "https://picsum.photos/id/50/600/600",
                      height: height,
                      radius: radius,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
