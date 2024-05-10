import 'package:flai_test/data/model/story_model.dart';
import 'package:flai_test/gen/assets.gen.dart';
import 'package:flai_test/utils/palette.dart';

class MockDataGateway {
  List<StoryModel> getStories() {
    List<Map<String, dynamic>> data = [
      {
        'imagePath': Assets.images.story1.path,
        'date': '26 Mar',
        'gradientColors': Palette.darkBlueGradientColors,
      },
      {
        'imagePath': Assets.images.story2.path,
        'date': '19 Mar',
        'gradientColors': Palette.goldGradientColors,
      },
      {
        'imagePath': Assets.images.story3.path,
        'date': '12 Mar',
        'gradientColors': Palette.pinkGradientColors,
      },
      {
        'imagePath': Assets.images.story4.path,
        'date': '5 Mar',
        'gradientColors': Palette.pinkGradientColors,
      }
    ];
    return data
        .map((e) => StoryModel(
            imageAsset: e['imagePath'],
            date: e['date'],
            gradientColors: e['gradientColors']))
        .toList();
  }
}
