import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:reactive_preferences/rp_container.dart';
import '/app.dart';
import '/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fabricConfig.fontFamily = "SFProDisplay";
  fabricConfig.color = fabricRed;

  //Reactive preferences
  await RP.init();
  ThemePreference.init();
  WelcomePreference.init();

  runApp(const App());
}
