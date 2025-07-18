import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class _PolaroidSettingsState extends ChangeNotifier {
  String? currentImage;
  String? backgroundImage;
  String description = "Image description";
  String date = "01/01/2022";
  String location = "Location";
  double rotation = 0.08;
  BoxFit boxFit = BoxFit.cover;

  reset() {
    currentImage = null;
    backgroundImage = null;
    description = "Image description";
    date = "01/01/2022";
    location = "Location";
    rotation = 0.08;
    boxFit = BoxFit.cover;

    notifyListeners();
  }

  setBoxFit(BoxFit fit) {
    boxFit = fit;
    notifyListeners();
  }

  setRotation(double rotation) {
    this.rotation = rotation;
    notifyListeners();
  }

  setDescription(String description) {
    this.description = description;
    notifyListeners();
  }

  setDate(String date) {
    this.date = date;
    notifyListeners();
  }

  setLocation(String location) {
    this.location = location;
    notifyListeners();
  }

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

  setBackgroundImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      backgroundImage = image.path;
    }

    notifyListeners();
  }
}

var polaroidSettingsState = _PolaroidSettingsState();
