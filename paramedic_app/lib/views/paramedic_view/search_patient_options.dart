import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class SearchPatientOptions extends StatelessWidget {
  const SearchPatientOptions(
      {super.key,
      this.onTap,
      required this.iconPathImage,
      required this.textOption});

  final Function()? onTap;
  final String iconPathImage;
  final String textOption;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(divide: 8),
        width: context.getWidth(),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
        ),
        child: Row(
          children: [
            Image.asset(
              iconPathImage,
              height: context.getHeight(divide: 8),
              color: red,
            ),
            width10,
            TextWidget(
              text: textOption,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
