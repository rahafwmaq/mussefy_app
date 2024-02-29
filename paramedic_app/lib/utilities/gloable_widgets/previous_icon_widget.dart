import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/view_layout/color.dart';

class PreviousPageIconWidget extends StatelessWidget {
  const PreviousPageIconWidget({super.key, this.appBarTitle});
  final String? appBarTitle;

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
        TextWidget(text: appBarTitle!)
      ],
    );
  }
}
