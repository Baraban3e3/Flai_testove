import 'package:flutter/material.dart';

class StoryModel {
  final String imageAsset;
  final String date;
  final List<Color> gradientColors;

  StoryModel(
      {required this.imageAsset,
      required this.gradientColors,
      required this.date});
}
