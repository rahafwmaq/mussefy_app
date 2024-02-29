import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';

import '../../view_layout/color.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/mussefy_logo.png'),
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
