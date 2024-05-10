import 'package:flai_test/data/mock_data_gateway.dart';
import 'package:flai_test/data/model/story_model.dart';
import 'package:flai_test/utils/palette.dart';
import 'package:flai_test/utils/utils.dart';
import 'package:flai_test/widgets/custom_app_bar.dart';
import 'package:flai_test/widgets/custom_bottom_bar.dart';
import 'package:flai_test/widgets/item_stats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mockGateway = MockDataGateway();
  final _stories = <StoryModel>[];

  int _selectedNavBarIndex = 2;
  int _selectedToggleIndex = 0;
  int _selectedStatsPeriodIndex = 0;

  bool _isButtonSelected(int buttonIndex) {
    return buttonIndex == _selectedToggleIndex;
  }

  @override
  void initState() {
    super.initState();
    _stories.addAll(_mockGateway.getStories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.23),
        child: CustomAppBar(
          stories: _stories,
        ),
      ),
      backgroundColor: Palette.bgColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: Palette.purpleGradientColors,
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Palette.bgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Utils.getLogoWidgets()
                        .entries
                        .map(
                          (e) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedToggleIndex = e.key;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Utils.getButtonBorder(
                                    isSelected: _isButtonSelected(e.key),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                child: Text(
                                  e.value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.4,
                                      color: _isButtonSelected(e.key)
                                          ? Palette.mainPurple
                                          : Palette.textColor,
                                      fontWeight: _isButtonSelected(e.key)
                                          ? FontWeight.bold
                                          : FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Palette.bgColor,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 16),
                        child: Text('Select the time period for statistics'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: Utils.getStatsPeriod()
                            .entries
                            .map((period) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedStatsPeriodIndex = period.key;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      period.value,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: _selectedStatsPeriodIndex ==
                                                period.key
                                            ? Palette.mainPurple
                                            : Palette.textColor,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                        child: ItemStats(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onTap: (index) => setState(() => _selectedNavBarIndex = index),
        selectedIndex: _selectedNavBarIndex,
      ),
    );
  }
}
