import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
    required this.rowTitle,
    required this.icon,
    this.onPressd,
  });

  final String rowTitle;
  final IconData icon;
  final Function()? onPressd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressd,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          width12,
          TextWidget(
            text: rowTitle,
            fontSize: 17,
          ),
        ],
      ),
    );
  }
}
