import 'dart:typed_data';
import '../components/editor_snackbar.dart';
import '/imports.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:share_plus/share_plus.dart';

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
      editorSnackbar(
        message: 'Image saved',
        context: context,
      );
    }
  } catch (e) {
    if (context.mounted) {
      editorSnackbar(
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
