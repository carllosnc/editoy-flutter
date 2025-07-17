import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class _PolaroidImageState extends ChangeNotifier {
  String? currentImage;

  setImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      currentImage = image.path;
    }

    notifyListeners();
  }

  @override
  notifyListeners();
}

var polaroidImageState = _PolaroidImageState();
