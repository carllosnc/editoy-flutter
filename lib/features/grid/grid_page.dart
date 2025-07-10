import 'package:editoy/features/grid/components/grid_2x2.dart';
import 'package:editoy/features/grid/components/grid_button.dart';
import 'package:editoy/imports.dart';
import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Grids'.pageTitle,
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: fabricConfig.color.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            spacing: 20,
            children: [
              GridButton(
                isSelected: currentPage == 0,
                pageController: _pageController,
                imagePath: "assets/images/grids/grid_2x2.png",
                pageNumber: 0,
              ),
              GridButton(
                isSelected: currentPage == 1,
                pageController: _pageController,
                imagePath: "assets/images/grids/grid_3x3.png",
                pageNumber: 1,
              ),
              GridButton(
                isSelected: currentPage == 2,
                pageController: _pageController,
                imagePath: "assets/images/grids/grid_1x3.png",
                pageNumber: 2,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          const Grid2x2(),
          Container(
            color: fabricConfig.color.shade800,
            child: const Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            color: fabricConfig.color.shade800,
            child: const Center(
              child: Text('Page 3'),
            ),
          ),
        ],
      ),
    );
  }
}
