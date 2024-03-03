import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    this.onTap,
    required this.iconPathImage,
    required this.heightContainer,
    required this.widthContainer,
    this.containerTitle,
    this.heightImage,
    this.widthImage,
    this.titleSize,
    this.titleSizeBox,
  });

  final Function()? onTap;
  final String iconPathImage;
  final double heightContainer;
  final double widthContainer;
  final String? containerTitle;
  final double? heightImage;
  final double? widthImage;
  final double? titleSize;
  final double? titleSizeBox;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(divide: heightContainer),
        width: context.getWidth(divide: widthContainer),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
        ),
        child: Row(
          children: [
            Image.asset(
              iconPathImage,
              height: context.getHeight(divide: heightImage ?? 12),
              width: context.getWidth(divide: widthImage ?? 4),
              color: blueTransit,
            ),
            SizedBox(
              width: context.getWidth(divide: titleSizeBox ?? 1.75),
              child: TextWidget(
                text: containerTitle ?? '',
                fontSize: titleSize ?? 20,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
