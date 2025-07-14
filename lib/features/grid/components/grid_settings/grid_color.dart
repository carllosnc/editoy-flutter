import '/imports.dart';
import 'package:flutter/material.dart';

/* Gird Color */

class GridColor extends StatefulWidget {
  const GridColor({super.key});

  @override
  State<GridColor> createState() => _GridColorState();
}

class _GridColorState extends State<GridColor> with SharedState {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.all(1),
            height: 300,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                spacing: 1,
                children: [
                  Row(spacing: 1, children: [
                    const ColorItem(color: Colors.white),
                    ColorItem(color: Colors.grey.shade200),
                    ColorItem(color: Colors.grey.shade300),
                    ColorItem(color: Colors.grey.shade400),
                    ColorItem(color: Colors.grey.shade500),
                    ColorItem(color: Colors.grey.shade600),
                    ColorItem(color: Colors.grey.shade700),
                    ColorItem(color: Colors.grey.shade800),
                    ColorItem(color: Colors.grey.shade900),
                    const ColorItem(color: Colors.black),
                  ]),
                  const ColorRow(color: Colors.red),
                  const ColorRow(color: Colors.blue),
                  const ColorRow(color: Colors.green),
                  const ColorRow(color: Colors.yellow),
                  const ColorRow(color: Colors.orange),
                  const ColorRow(color: Colors.purple),
                  const ColorRow(color: Colors.pink),
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(Icons.color_lens_outlined),
    );
  }
}

/* Color Row */

class ColorRow extends StatefulWidget {
  final MaterialColor color;

  const ColorRow({
    required this.color,
    super.key,
  });

  @override
  State<ColorRow> createState() => _ColorRowState();
}

class _ColorRowState extends State<ColorRow> with SharedState {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 1,
      children: [
        for (var color in widget.color.keys) ColorItem(color: widget.color[color]!),
      ],
    );
  }
}

/* Color Item */

class ColorItem extends StatefulWidget {
  final Color color;

  const ColorItem({
    required this.color,
    super.key,
  });

  @override
  State<ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> with SharedState {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          gridSettingsState.setColors(widget.color);
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 50,
          height: 40,
          child: Center(
            child: gridSettingsState.color == widget.color
                ? Icon(
                    Icons.check_circle,
                    color: widget.color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
