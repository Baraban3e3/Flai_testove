import 'package:flai_test/data/model/story_model.dart';
import 'package:flai_test/gen/assets.gen.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flai_test/widgets/custom_app_bar_button.dart';
import 'package:flai_test/widgets/story_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.stories,
    super.key,
  });

  final List<StoryModel> stories;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: Palette.purpleGradientColors,
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomAppBarButton(iconPath: Assets.icons.back),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 12),
                        child: Image.asset(Assets.images.avatar.path),
                      ),
                      const Text(
                        'Mia the kid',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                  CustomAppBarButton(iconPath: Assets.icons.more),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: stories
                    .map(
                      (story) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: StoryWidget(
                          imagePath: story.imageAsset,
                          date: story.date,
                          gradientColors: story.gradientColors,
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
