import 'package:flai_test/gen/assets.gen.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flai_test/widgets/custom_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ItemStats extends StatelessWidget {
  const ItemStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Weight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.4,
                  color: Palette.textColor,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  '-12.8%',
                  style: TextStyle(
                    color: Palette.green,
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset(Assets.icons.trending),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 48, bottom: 8),
              child: Text(
                '90.8 lbs',
                style: TextStyle(
                  color: Palette.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  height: 1.15,
                ),
              ),
            ),
            const Text(
              'Latest entry',
              style: TextStyle(
                color: Palette.lightPurple,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 140,
          width: 200,
          child: CustomChart(),
        )
      ],
    );
  }
}
