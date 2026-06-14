import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';


class SummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  final double size;
  const SummarySection({super.key, this.size =120,required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 16,
      children: [
        ProfileImage(
          width: size,
          height: size,
          image: profile?.image??"",
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             ( profile?.firstName ?? "") +( profile?.lastName ?? ""),
              style: AppTextStyles.title(
                context: context,
                color: colors.text2,
              ),
            ),

            const SizedBox(height: 4),
            Text(
              profile?.jobTitle ?? "",
              style: AppTextStyles.label(
                context: context,
                color: colors.secondary,
              ),
            ),
          ],
        ).expand,
      ],
    );
  }
}
