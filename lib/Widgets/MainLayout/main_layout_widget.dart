import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/summary_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../Utilities/Constants/global_keys.dart';
import 'menu_button.dart';

class MainLayoutWidget extends StatefulWidget {
  final Widget child;
  final String? currentPath;

  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  static const double _designWidth = 1539;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final scale =MediaQuery.of(context).size.width > 1539 ? (screenWidth / _designWidth).clamp(0.5, 1.0) : 1.0;

    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      floatingActionButton: const ThemeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SelectionArea(
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              width: _designWidth,
              child: Row(
                children: [
                  if (context.isLarge)
                    const LargeSummaryCard(),
                  widget.child.expand,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
