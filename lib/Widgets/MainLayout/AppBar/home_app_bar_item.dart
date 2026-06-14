import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Language/app_styles.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;
  final IconData icon;
  final TextStyle? titleStyle;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.titleStyle,
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? colors.border
                : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(100))
          ),
          child: Row(
            spacing: 4,
            children: [
              Icon(widget.icon,
                  size: 14, color:colors.text2),
              if(context.isLarge)
              Text(
                widget.title,
                style: AppTextStyles.semiBold12(
                    color:colors.text2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
