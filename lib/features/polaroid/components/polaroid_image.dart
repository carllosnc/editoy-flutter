import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/imports.dart';

class PolaroidImage extends StatefulWidget {
  const PolaroidImage({
    super.key,
  });

  @override
  State<PolaroidImage> createState() => _PolaroidImageState();
}

class _PolaroidImageState extends State<PolaroidImage> with SharedState {
  getImage() {
    if (polaroidImageState.currentImage != null) {
      return FileImage(File(polaroidImageState.currentImage!));
    }

    return const AssetImage("assets/images/polaroid_placeholder.png");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: 380,
      height: 500,
      child: Center(
        child: Transform.rotate(
          angle: 0.08,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage("assets/images/polaroid_texture.jpg"),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            width: 300,
            height: 400,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "08/10/2023",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.caveatBrush(
                          color: Colors.black,
                          height: 0.9,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Los Angeles, CA",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.caveatBrush(
                          color: Colors.black,
                          height: 0.9,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: getImage(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.red.withValues(alpha: 0.3),
                          onTap: () {
                            polaroidImageState.setImage();
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.caveatBrush(
                      color: Colors.black,
                      height: 0.9,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
