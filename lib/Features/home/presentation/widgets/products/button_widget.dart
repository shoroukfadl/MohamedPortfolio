import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:portfolio/Widgets/hover_widget.dart';

import '../../../../../Core/Language/app_styles.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final double width;
  final int index;
  final bool selected;
  final Function(int index) onTap;

  const ButtonWidget({super.key,this.selected =false, required this.title,this.width=140, required this.index, required this.onTap});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return HoverWidget(
      builder:(hover)=> CustomButtonWidget(
        title: widget.title,
        onPressed: () {
      widget.onTap(widget.index);
      setState((){});
        },
        width: widget.width,
        height: 32,
        titleStyle: AppTextStyles.semiBold12(color: widget.selected ? Colors.white:(hover ? colors.text2 : colors.text1)),
        borderColor: widget.selected ? colors.text1 :(!hover ? colors.border : colors.text3),
        btnColor: widget.selected ? colors.text1 : colors.surface,
        borderRadiusValue: 8,
      ),
    );
  }
}
