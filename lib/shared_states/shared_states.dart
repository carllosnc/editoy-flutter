import 'package:flutter/material.dart';
import 'counter_state.dart';
import 'grid_images_state.dart';
import 'grid_settings_state.dart';

mixin SharedState<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    themeState.addListener(action);
    gridImagesState.addListener(action);
    gridSettingsState.addListener(action);
  }

  @override
  void dispose() {
    super.dispose();
    themeState.removeListener(action);
    gridImagesState.removeListener(action);
    gridSettingsState.removeListener(action);
  }

  void action() {
    setState(() {});
  }
}
