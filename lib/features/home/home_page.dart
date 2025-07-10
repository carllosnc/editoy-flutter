import 'components/editing_card.dart';
import 'components/grid_cards.dart';
import 'package:flutter/material.dart';
import '/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Editoy".pageTitle,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 0,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 70,
            ),
            const EditingCard(),
            const GridCard()
          ],
        ),
      ),
    );
  }
}
