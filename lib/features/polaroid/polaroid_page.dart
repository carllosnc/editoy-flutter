import 'package:editoy/features/polaroid/components/polaroid_image.dart';

import '/imports.dart';
import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class PolaroidPage extends StatefulWidget {
  const PolaroidPage({super.key});

  @override
  State<PolaroidPage> createState() => _PolaroidPageState();
}

class _PolaroidPageState extends State<PolaroidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Polaroid".pageTitle,
        actions: [
          //rotate button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.rotate_right),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.color_lens_outlined),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: fabricConfig.color.shade900,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.edit_outlined),
              padding: const EdgeInsets.all(16),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.location_on_outlined),
              padding: const EdgeInsets.all(16),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_rounded),
              padding: const EdgeInsets.all(16),
            ),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
              padding: const EdgeInsets.all(16),
            ),
          ],
        ),
      ),
      body: Container(
        color: fabricConfig.color.shade800,
        child: const Center(
          child: PolaroidImage(),
        ),
      ),
    );
  }
}
