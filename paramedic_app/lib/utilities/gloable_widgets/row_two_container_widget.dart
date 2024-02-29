import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/container_widget.dart';

class RowTwoContainerWidget extends StatelessWidget {
  const RowTwoContainerWidget(
      {super.key,
      required this.firstImagePath,
      required this.firstTitle,
      required this.secondImagePath,
      required this.secondTitle,
      this.fisrtOnTap,
      this.secondOnTap});
  final String firstImagePath;
  final String firstTitle;
  final Function()? fisrtOnTap;

  final String secondImagePath;
  final String secondTitle;
  final Function()? secondOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ContainerWidget(
          onTap: fisrtOnTap,
          iconPathImage: firstImagePath,
          heightContainer: 10,
          widthContainer: 2.3,
          heightImage: 15,
          widthImage: 5,
          titleSizeBox: 5,
          containerTitle: firstTitle,
          titleSize: 14,
        ),
        ContainerWidget(
          onTap: secondOnTap,
          iconPathImage: secondImagePath,
          heightContainer: 10,
          widthContainer: 2.3,
          heightImage: 15,
          widthImage: 5,
          titleSizeBox: 5,
          containerTitle: secondTitle,
          titleSize: 14,
        ),
      ],
    );
  }
}
