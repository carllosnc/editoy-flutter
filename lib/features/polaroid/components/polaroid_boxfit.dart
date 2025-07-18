import 'package:flutter/material.dart';
import '/imports.dart';

class PolaroidBoxfit extends StatefulWidget {
  const PolaroidBoxfit({super.key});

  @override
  State<PolaroidBoxfit> createState() => _PolaroidBoxfitState();
}

class _PolaroidBoxfitState extends State<PolaroidBoxfit> with SharedState {
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
        return IconButton.outlined(
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
        final isSelected = polaroidSettingsState.boxFit == entry.key;
        return MenuItemButton(
          onPressed: () => polaroidSettingsState.setBoxFit(entry.key),
          trailingIcon: isSelected ? const Icon(Icons.check_outlined, color: Colors.greenAccent) : null,
          child: Text(entry.value),
        );
      }).toList(),
    );
  }
}
