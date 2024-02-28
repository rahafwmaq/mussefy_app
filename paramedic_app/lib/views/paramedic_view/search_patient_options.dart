import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class SearchPatientOptions extends StatelessWidget {
  const SearchPatientOptions({
    super.key,
    this.onTap,
    required this.iconPathImage,
  });

  final Function()? onTap;
  final String iconPathImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(divide: 8),
        width: context.getWidth(divide: 4),
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
          ],
        ),
      ),
    );
  }
}
