import '/imports.dart';
import 'package:flutter/material.dart';

class GridSpacing extends StatefulWidget {
  const GridSpacing({super.key});

  @override
  State<GridSpacing> createState() => _GridSpacingState();
}

class _GridSpacingState extends State<GridSpacing> with SharedState {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 25,
              ),
              height: 200,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Spacing: ${gridSettingsState.spacing.round().toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Slider(
                    value: gridSettingsState.spacing,
                    min: 2,
                    max: 25,
                    label: gridSettingsState.spacing.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        gridSettingsState.setSpacing(value);
                      });
                    },
                  ),
                ],
              ),
            );
          }),
        );
      },
      icon: const Icon(Icons.border_all_outlined),
    );
  }
}
