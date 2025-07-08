import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

typedef ImageCallback = void Function({
  required XFile image,
  required BuildContext context,
});
