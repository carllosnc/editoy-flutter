import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:reactive_preferences/rp_container.dart';
import '/app.dart';
import '/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final noScreenshot = NoScreenshot.instance;

  fabricConfig.fontFamily = "SFProDisplay";
  fabricConfig.color = fabricRed;

  await RP.init();
  await noScreenshot.screenshotOff();

  ThemePreference.init();
  WelcomePreference.init();

  runApp(const App());
}
