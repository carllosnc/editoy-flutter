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
    if (polaroidSettingsState.currentImage != null) {
      return FileImage(File(polaroidSettingsState.currentImage!));
    }

    return const AssetImage("assets/images/polaroid_placeholder.png");
  }

  getBackgroundImage() {
    if (polaroidSettingsState.backgroundImage != null) {
      return FileImage(File(polaroidSettingsState.backgroundImage!));
    }

    return const AssetImage("assets/images/polaroid_background_placeholder.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          image: getBackgroundImage(),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Transform.rotate(
          angle: polaroidSettingsState.rotation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
            height: 430,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        polaroidSettingsState.date,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.caveatBrush(
                          color: Colors.black,
                          height: 0.9,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        polaroidSettingsState.location,
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
                    child: InteractiveViewer(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: getImage(),
                            fit: polaroidSettingsState.boxFit,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.red.withValues(alpha: 0.3),
                            onTap: () {
                              polaroidSettingsState.setImage();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    polaroidSettingsState.description,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.caveatBrush(
                      color: Colors.black,
                      height: 0.9,
                      fontSize: 23,
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
