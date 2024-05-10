import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    required this.iconPath,
    super.key,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SvgPicture.asset(iconPath),
    );
  }
}
