import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    required this.imagePath,
    required this.date,
    this.gradientColors,
    super.key,
  });

  final String imagePath;
  final String date;
  final List<Color>? gradientColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: LinearGradient(
                colors: gradientColors ?? [Colors.blue, Colors.red],
              ),
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
