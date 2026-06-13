import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const SectionsTitleWidget(
      {super.key,
      required this.title,
      this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Icon(icon,size: 18,color: colors.text1,),
        4.0.widthBox,
        Text(
          title,
          style: AppTextStyles.sectionTitle(context: context ,color: colors.text1),
        ),
        24.0.widthBox,
        const DividerWidget().expand,
        if (subtitle != null)
         ... [
        24.0.widthBox,
           CardWithText(
            text: subtitle!,
            textColor: colors.accent,
            color: colors.accent.withValues(alpha: 0.2),
            borderColor: colors.accent,
            style:  AppTextStyles.titleCardSmall(context: context,color: colors.accent),
          ),]
      ],
    );
  }
}
