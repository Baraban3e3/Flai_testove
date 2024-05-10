import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flai_test/utils/custom_icons.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flutter/material.dart';

class Utils {
  static List<TabItem> tabItems = const [
    TabItem(
      icon: MyFlutterApp.home,
    ),
    TabItem(
      icon: MyFlutterApp.storefront,
    ),
    TabItem(
      icon: MyFlutterApp.gavel,
    ),
    TabItem(
      icon: MyFlutterApp.notifications,
    ),
    TabItem(icon: MyFlutterApp.account_circle),
  ];

  static List<String> getDaysOfWeek() {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
  }

  static Map<int, String> getStatsPeriod() {
    return {
      0: 'Day',
      1: 'Week',
      2: 'Month',
      3: 'Year',
    };
  }

  static Map<int, String> getLogoWidgets() {
    return <int, String>{
      0: 'Statistics',
      1: 'Photos',
      2: 'Meals',
    };
  }

  static Border getButtonBorder({required bool isSelected}) {
    return isSelected
        ? const Border(
            bottom: BorderSide(width: 3, color: Palette.mainPurple),
            top: BorderSide(
              width: 1,
              color: Palette.lightBorder,
            ),
            right: BorderSide(
              width: 1,
              color: Palette.lightBorder,
            ),
            left: BorderSide(
              width: 1,
              color: Palette.lightBorder,
            ),
          )
        : Border.all(
            width: 1,
            color: Palette.lightBorder,
          );
  }
}
