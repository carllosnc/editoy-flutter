import 'package:flutter/material.dart';

editingDone({
  required BuildContext context,
  required Function() onSave,
  required Function() onShare,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 170,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              onTap: () async {
                await onSave();
              },
              trailing: const Icon(
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
                await onShare();
              },
              trailing: const Icon(
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
    },
  );
}
