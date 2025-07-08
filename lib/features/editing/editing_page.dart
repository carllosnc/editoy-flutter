import 'dart:typed_data';

import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import './components/editing_done.dart';

class EditingPage extends StatefulWidget {
  final XFile file;
  const EditingPage({
    super.key,
    required this.file,
  });

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  @override
  Widget build(BuildContext context) {
    return ProImageEditor.file(
      widget.file.path,
      configs: ProImageEditorConfigs(
        mainEditor: const MainEditorConfigs(
          style: MainEditorStyle(
            background: Colors.black,
          ),
        ),
        theme: fabricConfig.getDarkTheme(),
        designMode: ImageEditorDesignMode.material,
        tuneEditor: const TuneEditorConfigs(
          style: TuneEditorStyle(
            background: Colors.black,
            bottomBarBackground: Colors.black,
            bottomBarActiveItemColor: Colors.greenAccent,
          ),
        ),
        filterEditor: const FilterEditorConfigs(
          style: FilterEditorStyle(
            appBarBackground: Colors.black,
            background: Colors.black,
            appBarColor: Colors.black,
            previewSelectedTextColor: Colors.greenAccent,
          ),
        ),
        blurEditor: const BlurEditorConfigs(
          style: BlurEditorStyle(
            background: Colors.black,
          ),
        ),
        cropRotateEditor: const CropRotateEditorConfigs(
          style: CropRotateEditorStyle(
            aspectRatioSheetBackgroundColor: Colors.black,
            background: Colors.black,
          ),
        ),
        paintEditor: const PaintEditorConfigs(
          enableModePixelate: false,
          style: PaintEditorStyle(
            background: Colors.black,
            bottomBarActiveItemColor: Colors.greenAccent,
            lineWidthBottomSheetBackground: Colors.black,
            opacityBottomSheetBackground: Colors.black,
            lineWidthBottomSheetTitle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            opacityBottomSheetTitle: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        textEditor: TextEditorConfigs(
          showFontScaleButton: false,
          style: const TextEditorStyle(
            bottomBarBackground: Colors.red,
          ),
          customTextStyles: [
            GoogleFonts.luckiestGuy(
              height: 2,
              wordSpacing: 4,
            ),
          ],
        ),
      ),
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) async {
          editingDone(
            context: context,
            onSave: () async {},
            onShare: () async {},
          );
        },
      ),
    );
  }
}
