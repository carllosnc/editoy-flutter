import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/rendering.dart';

import '/imports.dart';
import 'action_snackbar.dart';

Future<Uint8List> captureWidget({
  required GlobalKey globalKey,
}) async {
  final RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

  final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

  final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  final Uint8List pngBytes = byteData!.buffer.asUint8List();

  return pngBytes;
}

saveImage({
  required Uint8List result,
  required BuildContext context,
}) async {
  Navigator.pop(context);

  try {
    await ImageGallerySaverPlus.saveImage(
      result,
      name: "editoy_${getRandomString(7)}",
      quality: 100,
    );

    if (context.mounted) {
      actionSnackbar(
        message: 'Image saved',
        context: context,
      );
    }
  } catch (e) {
    if (context.mounted) {
      actionSnackbar(
        message: 'Error saving image',
        isError: true,
        context: context,
      );
    }
  }
}

shareImage({
  required Uint8List result,
  required BuildContext context,
}) async {
  final params = ShareParams(files: [
    XFile.fromData(
      result,
      name: "editoy_${getRandomString(7)}",
      mimeType: 'image/png',
    )
  ]);

  SharePlus.instance.share(params);
}
