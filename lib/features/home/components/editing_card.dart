import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditingCard extends StatelessWidget {
  const EditingCard({super.key});

  getImageFromGalleryHandle(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null && context.mounted) {
      context.push('/editing', extra: image);
    }
  }

  void action({
    required XFile image,
    required BuildContext context,
  }) {
    context.push('/editing', extra: image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: fabricConfig.color.shade800,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/editing_image.png",
                width: 100,
              ),
              Flexible(
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Edit your photos".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Use tools like crop, rotate, resize, emojis, paint, filters, etc.",
                      style: TextStyle(
                        fontSize: 14,
                        color: fabricConfig.color.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Text(
            "Open image from:",
            style: TextStyle(
              fontSize: 14,
              color: fabricConfig.color.shade300,
            ),
          ),
          Row(
            spacing: 10,
            children: [
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => getImageFromGalleryHandle(context),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text("Gallery"),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.push(
                        '/camera',
                        extra: action,
                      );
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text("Camera"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
