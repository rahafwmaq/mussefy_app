import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class KeyBodyDigram extends StatelessWidget {
  const KeyBodyDigram(
      {super.key,
      required this.positionTop,
      required this.positionLeft,
      required this.keyName, required this.color});

  final double positionTop;
  final double positionLeft;
  final String keyName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.getHeight(divide: positionTop),
      left: context.getWidth(divide: positionLeft),
      child: Row(
        children: [
          Container(
            height: context.getHeight(divide: 20),
            width: context.getWidth(divide: 10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
          ),
          width10,
          TextWidget(text: keyName)
        ],
      ),
    );
  }
}
