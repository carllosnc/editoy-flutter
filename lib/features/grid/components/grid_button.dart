import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final PageController _pageController;
  final int pageNumber;
  final String imagePath;
  final bool isSelected;

  const GridButton({
    super.key,
    required PageController pageController,
    required this.imagePath,
    required this.pageNumber,
    this.isSelected = false,
  }) : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          pageNumber,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCirc,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(17),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : fabricConfig.color.shade700,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}
