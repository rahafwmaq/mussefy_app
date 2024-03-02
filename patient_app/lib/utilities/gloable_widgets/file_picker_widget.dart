// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        width: context.getWidth(divide: 2),
        height: context.getHeight(divide: 18),
        borderColor: noColor,
        borderWidth: 0,
        borderRadius: 15,
        containerColor: redTransit,
        blurRadius: 5,
        shadowColor: Colors.black26,
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.file_download_rounded,
                color: white,
              ),
              width10,
              TextWidget(
                text: 'pick_file.buttom_name'.tr(),
                fontSize: 20,
                textColor: white,
              ),
            ],
          ),
        ));
  }
}
