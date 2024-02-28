import 'package:flutter/material.dart';
import 'package:mussefy_app/view_layout/color.dart';

class TranslationIconWidget extends StatelessWidget {
  const TranslationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.translate,
            size: 35,
            color: red,
          ),
        ),
      ],
    );
  }
}
