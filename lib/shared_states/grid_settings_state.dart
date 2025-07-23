import 'package:flutter/material.dart';

class _GridSettingsState extends ChangeNotifier {
  Color color = Colors.white;
  double spacing = 5;
  BoxFit boxFit = BoxFit.cover;
  double width = 350;
  double height = 400;

  setColors(Color color) {
    this.color = color;
    notifyListeners();
  }

  setSpacing(double spacing) {
    this.spacing = spacing;
    notifyListeners();
  }

  setBoxFit(BoxFit boxFit) {
    this.boxFit = boxFit;
    notifyListeners();
  }
}

var gridSettingsState = _GridSettingsState();
