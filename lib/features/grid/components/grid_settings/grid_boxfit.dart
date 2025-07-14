import 'package:flutter/material.dart';
import '/imports.dart';

class GridBoxfit extends StatefulWidget {
  const GridBoxfit({super.key});

  @override
  State<GridBoxfit> createState() => _GridBoxfitState();
}

class _GridBoxfitState extends State<GridBoxfit> with SharedState {
  static const Map<BoxFit, String> _boxFitOptions = {
    BoxFit.cover: 'Cover',
    BoxFit.contain: 'Contain',
    BoxFit.fitWidth: 'Fit Width',
    BoxFit.fitHeight: 'Fit Height',
    BoxFit.fill: 'Fill',
  };

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.fit_screen_outlined),
          tooltip: 'Box Fit',
        );
      },
      menuChildren: _boxFitOptions.entries.map((entry) {
        final isSelected = gridSettingsState.boxFit == entry.key;
        return MenuItemButton(
          onPressed: () => gridSettingsState.setBoxFit(entry.key),
          trailingIcon: isSelected ? const Icon(Icons.check_outlined, color: Colors.greenAccent) : null,
          child: Text(entry.value),
        );
      }).toList(),
    );
  }
}
