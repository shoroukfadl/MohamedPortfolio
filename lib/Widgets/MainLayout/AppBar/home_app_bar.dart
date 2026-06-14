import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/portifilo_icons.dart';
import 'home_app_bar_item.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 56,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      margin: const EdgeInsetsDirectional.symmetric(vertical:24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: colors.border,width: 0.4),
        boxShadow: [BoxShadow(
          color: colors.border,
          blurRadius: 4,
          spreadRadius: 2,
          offset: const Offset(0, 4)
        )],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.profile != p.data?.profile ,
              builder: (context, state) {
                final profile = state.data?.profile;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
              Text(
                ( profile?.firstName) == null?"":( profile!.firstName!).substring(0,1),
                style: AppTextStyles.titleSmall(
                context: context,
                color: colors.text2,
                ),
                ),
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: colors.secondary,
                  ).paddingOnly(top: 4),
                Text(
               ( profile?.lastName ?? "").split(" ").last,
                style: AppTextStyles.titleSmall(
                context: context,
                color: colors.text2,
                ),
                )
                ],
              );
            }
          ),
          VertGradintDividerWidget(
            color1: colors.border,
            color2:colors.border,
            height: 20,
            thickness: 2,


          ),

          HomeAppBarItem(
            icon: Portfolio.summary,
            onTap: () {
              Scrollable.ensureVisible(
                GlobalKeys.aboutMe.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            title: Strings.aboutMe.translate,
          ),
          HomeAppBarItem(
              icon: Portfolio.education,
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.education.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.education.translate,
            ),
         HomeAppBarItem(
              icon: Portfolio.skills,
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.skill.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.mySkill.translate,
            ),
         HomeAppBarItem(
              icon: Portfolio.work,
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.experince.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.experience.translate,
            ),
          HomeAppBarItem(
            icon: Portfolio.projects,
            onTap: () {
              Scrollable.ensureVisible(
                GlobalKeys.projects.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            title: Strings.projects.translate,
          ),
          HomeAppBarItem(
            icon: Portfolio.email,
            onTap: () {
              Scrollable.ensureVisible(
                GlobalKeys.contactMe.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            title: Strings.contactMe.translate,
          ),

        ],
      ),
    );
  }
}
