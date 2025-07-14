import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class _GridImagesState extends ChangeNotifier {
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? image7;
  String? image8;
  String? image9;

  Future<String?> getImagePath() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      return image.path;
    }

    return null;
  }

  setImage(int image) async {
    var currentImage = await getImagePath();

    if (currentImage != null && image == 1) image1 = currentImage;
    if (currentImage != null && image == 2) image2 = currentImage;
    if (currentImage != null && image == 3) image3 = currentImage;
    if (currentImage != null && image == 4) image4 = currentImage;
    if (currentImage != null && image == 5) image5 = currentImage;
    if (currentImage != null && image == 6) image6 = currentImage;
    if (currentImage != null && image == 7) image7 = currentImage;
    if (currentImage != null && image == 8) image8 = currentImage;
    if (currentImage != null && image == 9) image9 = currentImage;

    notifyListeners();
  }

  @override
  notifyListeners();
}

var gridImagesState = _GridImagesState();
