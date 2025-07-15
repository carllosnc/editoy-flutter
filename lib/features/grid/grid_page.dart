import 'dart:typed_data';

import 'package:editoy/features/grid/components/grids/grid_1x3.dart';

import '/imports.dart';

import 'package:fabric/fabric_config.dart';
import 'package:flutter/material.dart';

//settings
import 'components/grid_settings/grid_boxfit.dart';
import 'components/grid_settings/grid_spacing.dart';
import 'components/grid_settings/grid_color.dart';

//grid
import 'components/grids/grid_1x2.dart';
import 'components/grids/grid_2x2.dart';
import 'components/grids/grid_3x1.dart';
import 'components/grids/grid_3x3.dart';
import 'components/grids/grid_e.dart';
import 'components/grids/grid_t.dart';
import 'components/grid_button.dart';
import 'components/grids/grid_2x1.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(keepPage: true);
  final ScrollController _scrollController = ScrollController();

  int _currentPage = 0;

  GlobalKey globalKey0 = GlobalKey();
  GlobalKey globalKey1 = GlobalKey();
  GlobalKey globalKey2 = GlobalKey();
  GlobalKey globalKey3 = GlobalKey();
  GlobalKey globalKey4 = GlobalKey();
  GlobalKey globalKey5 = GlobalKey();
  GlobalKey globalKey6 = GlobalKey();
  GlobalKey globalKey7 = GlobalKey();
  GlobalKey currentGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    currentGlobalKey = globalKey0;

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        double width = MediaQuery.of(context).size.width;

        if (_currentPage == 0) {
          currentGlobalKey = globalKey0;
        } else if (_currentPage == 1) {
          currentGlobalKey = globalKey1;
        } else if (_currentPage == 2) {
          currentGlobalKey = globalKey2;
        } else if (_currentPage == 3) {
          currentGlobalKey = globalKey3;
        } else if (_currentPage == 4) {
          currentGlobalKey = globalKey4;
        } else if (_currentPage == 5) {
          currentGlobalKey = globalKey5;
        } else if (_currentPage == 6) {
          currentGlobalKey = globalKey6;
        } else if (_currentPage == 7) {
          currentGlobalKey = globalKey7;
        }

        _scrollController.animateTo(
          ((_currentPage * 60) - ((width / 2) - 70)).toDouble(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
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
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: 'Grids'.pageTitle,
        actions: const [
          GridBoxfit(),
          GridSpacing(),
          GridColor(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          editingDone(
            context: context,
            onSave: () async {
              final Uint8List result = await captureWidget(
                globalKey: currentGlobalKey,
              );

              if (context.mounted) {
                saveImage(result: result, context: context);
              }
            },
            onShare: () async {
              final Uint8List result = await captureWidget(
                globalKey: currentGlobalKey,
              );

              if (context.mounted) {
                shareImage(result: result, context: context);
              }
            },
          );
        },
        child: const Icon(Icons.check_outlined),
      ),
      bottomNavigationBar: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Container(
          height: 100,
          color: fabricConfig.color.shade900,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              spacing: 10,
              children: [
                GridButton(
                  isSelected: _currentPage == 0,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_2x2.png",
                  pageNumber: 0,
                ),
                GridButton(
                  isSelected: _currentPage == 1,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_3x3.png",
                  pageNumber: 1,
                ),
                GridButton(
                  isSelected: _currentPage == 2,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_t.png",
                  pageNumber: 2,
                ),
                GridButton(
                  isSelected: _currentPage == 3,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_2x1.png",
                  pageNumber: 3,
                ),
                GridButton(
                  isSelected: _currentPage == 4,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_1x2.png",
                  pageNumber: 4,
                ),
                GridButton(
                  isSelected: _currentPage == 5,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_1x3.png",
                  pageNumber: 5,
                ),
                GridButton(
                  isSelected: _currentPage == 6,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_3x1.png",
                  pageNumber: 6,
                ),
                GridButton(
                  isSelected: _currentPage == 7,
                  pageController: _pageController,
                  imagePath: "assets/images/grids/grid_e.png",
                  pageNumber: 7,
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Grid2x2(globalKey: globalKey0),
          Grid3x3(globalKey: globalKey1),
          GridT(globalKey: globalKey2),
          Grid2x1(globalKey: globalKey3),
          Grid1x2(globalKey: globalKey4),
          Grid1x3(globalKey: globalKey5),
          Grid3x1(globalKey: globalKey6),
          GridE(globalKey: globalKey7),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
