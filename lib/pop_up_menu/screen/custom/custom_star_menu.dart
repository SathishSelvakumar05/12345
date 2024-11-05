import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';

class MenuItem {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  MenuItem({
    required this.icon,
    required this.color,
    required this.onPressed,
  });
}

class StarMenuComponent extends StatelessWidget {
  final List<MenuItem> items;

  const StarMenuComponent({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StarMenuController controller = StarMenuController();
    return StarMenu(
      onItemTapped: (index, controller) {
        controller.closeMenu!();
      },
      params: StarMenuParameters(
        shape: MenuShape.grid,
        closeDurationMs: 400,
        //openDurationMs: 500,
        gridShapeParams: GridShapeParams(columns: 5),
        // backgroundParams: BackgroundParams(backgroundColor: Colors.grey),
        animationCurve: Curves.easeInCirc,
        centerOffset: Offset(15, 15),
        boundaryBackground: BoundaryBackground(color: Colors.white),
      ),
      items: items.map((item) {
        return IconButton(
          icon: Icon(item.icon, color: item.color),
          onPressed: item.onPressed,
        );
      }).toList(),
      child: Icon(Icons.more_vert, size: 30),
    );
  }
}
