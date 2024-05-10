import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flai_test/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.onTap,
    required this.selectedIndex,
    super.key,
  });

  final dynamic Function(int)? onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomBarInspiredInside(
      indexSelected: selectedIndex,
      items: Utils.tabItems,
      colorSelected: Colors.white,
      backgroundColor: Colors.white,
      color: Palette.darkBlue,
      animated: true,
      chipStyle: const ChipStyle(
          convexBridge: true, background: Color.fromARGB(255, 35, 179, 83)),
      itemStyle: ItemStyle.circle,
      sizeInside: 64,
      onTap: onTap,
    );
  }
}
