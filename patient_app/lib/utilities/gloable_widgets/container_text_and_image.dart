import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class ContainerTextAndImageWidget extends StatelessWidget {
  const ContainerTextAndImageWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap});
  final String imagePath;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: ContainerWidget(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: context.getHeight(divide: 10),
          width: context.getWidth(divide: 2),
          borderRadius: 20,
          borderColor: noColor,
          borderWidth: 0,
          containerColor: white,
          shadowColor: lightGrey,
          blurRadius: 5,
          child: Row(
            children: [
              height10,
              Image.asset(
                imagePath,
                color: red,
                scale: 10,
              ),
              width10,
              height20,
              SizedBox(
                width: context.getHeight(divide: 7),
                
                child: TextWidget(
                  text: title,
                  textColor: black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
