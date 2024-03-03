import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

import '../../view_layout/color.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/paramedic_logo.png'),
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
