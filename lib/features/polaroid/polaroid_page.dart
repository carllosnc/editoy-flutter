import 'dart:typed_data';

import 'components/polaroid_boxfit.dart';
import 'components/polaroid_image.dart';
import 'components/polaroid_info.dart';
import 'components/polaroid_rotation.dart';

import '/imports.dart';
import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class PolaroidPage extends StatefulWidget {
  const PolaroidPage({super.key});

  @override
  State<PolaroidPage> createState() => _PolaroidPageState();
}

class _PolaroidPageState extends State<PolaroidPage> with SharedState {
  GlobalKey polaroidGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Polaroid".pageTitle,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          editingDone(
            context: context,
            onSave: () async {
              final Uint8List result = await captureWidget(
                globalKey: polaroidGlobalKey,
              );

              if (context.mounted) {
                saveImage(result: result, context: context);
              }
            },
            onShare: () async {
              final Uint8List result = await captureWidget(
                globalKey: polaroidGlobalKey,
              );

              if (context.mounted) {
                shareImage(result: result, context: context);
              }
            },
          );
        },
        child: const Icon(Icons.check_outlined),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: fabricConfig.color.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                spacing: 3,
                children: [
                  const PolaroidInfo(),
                  IconButton.outlined(
                    onPressed: () {
                      polaroidSettingsState.setBackgroundImage();
                    },
                    icon: const Icon(Icons.image_outlined),
                  ),
                  const PolaroidRotation(),
                  const PolaroidBoxfit(),
                ],
              ),
              IconButton.outlined(
                onPressed: () {
                  polaroidSettingsState.reset();
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: fabricConfig.color.shade800,
        child: Center(
          child: RepaintBoundary(
            key: polaroidGlobalKey,
            child: const PolaroidImage(),
          ),
        ),
      ),
    );
  }
}
