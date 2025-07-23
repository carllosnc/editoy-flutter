import 'dart:typed_data';

import 'package:editoy/features/editing_done/image_actions.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import '../editing_done/editing_done.dart';

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
            editSheetBackgroundColor: Colors.black,
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
          showSelectFontStyleBottomBar: true,
          style: const TextEditorStyle(
            bottomBarBackground: Colors.blue,
          ),
          customTextStyles: [
            GoogleFonts.anton(height: 1.6),
            GoogleFonts.syne(
              height: 1.3,
              fontWeight: FontWeight.w800,
            ),
            GoogleFonts.yesevaOne(height: 1.3),
            GoogleFonts.caveatBrush(height: 1.3),
            GoogleFonts.bungee(height: 1.3),
            GoogleFonts.slackey(height: 1.5),
            GoogleFonts.sedgwickAveDisplay(height: 1.8),
            GoogleFonts.pirataOne(height: 1.3),
            GoogleFonts.creepster(height: 1.3),
            GoogleFonts.caesarDressing(height: 1.3),
            GoogleFonts.limelight(height: 1.3),
            GoogleFonts.bangers(height: 1.3),
            GoogleFonts.lacquer(height: 1.3),
            GoogleFonts.kavoon(height: 1.3),
            GoogleFonts.permanentMarker(height: 1.3),
            GoogleFonts.dmSerifDisplay(height: 1.3),
            GoogleFonts.silkscreen(height: 1.3),
            GoogleFonts.boogaloo(height: 1.3),
            GoogleFonts.squadaOne(height: 1.3),
            GoogleFonts.bowlbyOne(height: 1.8),
          ],
        ),
      ),
      callbacks: ProImageEditorCallbacks(
        onImageEditingComplete: (Uint8List bytes) async {
          editingDone(
            context: context,
            onSave: () async {
              saveImage(
                result: bytes,
                context: context,
              );
            },
            onShare: () async {
              shareImage(
                result: bytes,
                context: context,
              );
            },
          );
        },
      ),
    );
  }
}
