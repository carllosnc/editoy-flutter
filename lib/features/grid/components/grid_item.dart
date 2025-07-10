import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GridItem extends StatefulWidget {
  final double height;
  final double radius;
  final String imagePath;

  const GridItem({
    super.key,
    required this.height,
    required this.radius,
    required this.imagePath,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  String selectedImagePath = "";

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: widget.height,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(widget.radius),
          image: DecorationImage(
            alignment: Alignment.center,
            image: FileImage(File(selectedImagePath)),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.red.withValues(alpha: 0.3),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(
                source: ImageSource.gallery,
              );

              if (image != null && context.mounted) {
                setState(() {
                  selectedImagePath = image.path;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
