import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

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
          Image.asset(
            "assets/images/grid_images.png",
          ),
          Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create grids of images".toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Create grids of images with different sizes and shapes.",
                style: TextStyle(
                  fontSize: 14,
                  color: fabricConfig.color.shade300,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.push('/grid');
              },
              icon: const Icon(Icons.grid_on),
              label: const Text("Create grid"),
            ),
          )
        ],
      ),
    );
  }
}
