import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_button.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/portifilo_icons.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<ThemeCubit,ThemeState>(
      buildWhen: (c,p)=>c.isDark !=p.isDark,
      builder: (context, s) {
        return ContactButton(
          onTap: () {
            context.read<ThemeCubit>().changeTheme();
          },
          width: 40,
          height: 40,
          iconSize: 24,
          backgroundColor: s.isDark ? colors.secondary: colors.card,
          borderColor: colors.secondary,
          iconColor: s.isDark ? Colors.white: colors.secondary,
          icon: Portfolio.theme,
        );
      }
    );
  }
}
