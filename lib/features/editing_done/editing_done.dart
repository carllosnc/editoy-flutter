import 'package:flutter/material.dart';

editingDone({
  required BuildContext context,
  required Function() onSave,
  required Function() onShare,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      bool isSaving = false;
      bool isShareing = false;

      return StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          height: 170,
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                onTap: () async {
                  setState(() {
                    isSaving = true;
                  });
                  await onSave();
                  setState(() {
                    isSaving = false;
                  });
                },
                trailing: isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Icon(
                        Icons.save_outlined,
                        color: Colors.white,
                      ),
                title: const Text(
                  'Save image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                onTap: () async {
                  setState(() {
                    isShareing = true;
                  });
                  await onShare();
                  setState(() {
                    isShareing = false;
                  });
                },
                trailing: isShareing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                title: const Text(
                  'Share image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
