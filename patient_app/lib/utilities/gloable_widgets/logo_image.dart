import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/patients_logo.png'),
        height10,
        const TextWidget(
          text: 'مسعفي',
          textColor: red,
          fontSize: 40,
        ),
        const TextWidget(
          text: 'الثواني الأولى تشكل الفرق',
          textColor: blue,
          fontSize: 25,
        ),
      ],
    );
  }
}
