import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/view_layout/color.dart';

class PreviousPageIconWidget extends StatelessWidget {
  const PreviousPageIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.popView();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 35,
            color: red,
          ),
        ),
      ],
    );
  }
}
