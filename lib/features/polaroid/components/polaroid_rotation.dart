import '/imports.dart';
import 'package:flutter/material.dart';

class PolaroidRotation extends StatefulWidget {
  const PolaroidRotation({super.key});

  @override
  State<PolaroidRotation> createState() => _PolaroidRotationState();
}

class _PolaroidRotationState extends State<PolaroidRotation> with SharedState {
  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) => StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              height: 200,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Rotation: ${polaroidSettingsState.rotation.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Slider(
                    value: polaroidSettingsState.rotation,
                    min: -0.15,
                    max: 0.15,
                    label: polaroidSettingsState.rotation.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        polaroidSettingsState.setRotation(value);
                      });
                    },
                  ),
                ],
              ),
            );
          }),
        );
      },
      icon: const Icon(Icons.rotate_right),
    );
  }
}
