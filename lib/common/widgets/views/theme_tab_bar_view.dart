import 'package:flutter/material.dart';

import 'package:pet_community_app/common/common.dart';

class ThemeTabBarView extends StatefulWidget {
  const ThemeTabBarView({
    super.key,
    required this.labels,
    required this.views,
  });

  final List<String> labels;
  final List<Widget> views;

  @override
  State<ThemeTabBarView> createState() => _ThemeTabBarViewState();
}

class _ThemeTabBarViewState extends State<ThemeTabBarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.labels.length,
      child: Column(
        children: [
          TabBar(
            dividerHeight: 1,
            dividerColor: Palette.gray300,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: TextStyles.textMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF050505),
            ),
            unselectedLabelStyle: TextStyles.textMedium.copyWith(
              color: const Color(0xFF8E95A3),
            ),
            indicatorWeight: 2,
            indicatorColor: const Color(0xFF050505),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: widget.labels
                .map((label) => Tab(height: 32, text: label))
                .toList(),
          ),
          Expanded(
            child: TabBarView(children: widget.views),
          ),
        ],
      ),
    );
  }
}
