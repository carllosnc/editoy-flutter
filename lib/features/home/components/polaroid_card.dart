import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PolaroidCard extends StatelessWidget {
  const PolaroidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: fabricConfig.color.shade800,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            spacing: 20,
            children: [
              const Image(
                image: AssetImage("assets/images/polaroid.png"),
                width: 150,
              ),
              Flexible(
                child: Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Polaroid".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Create a polaroid style photo with description, date and location.",
                      style: TextStyle(
                        fontSize: 15,
                        color: fabricConfig.color.shade200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.push('/polaroid');
              },
              icon: const Icon(Icons.photo_camera_outlined),
              label: const Text("Create polaroid photo"),
            ),
          )
        ],
      ),
    );
  }
}
