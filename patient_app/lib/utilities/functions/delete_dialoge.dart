import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';

Future<dynamic> deleteAlert(
    {required BuildContext context,
    required String content,
    required Function() onPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: TextWidget(text: 'deleteDialog.title'.tr()),
      content: TextWidget(
        text: content,
        fontSize: 20,
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: TextWidget(
            text: 'deleteDialog.yes'.tr(),
            textColor: red,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: TextWidget(
            text: 'deleteDialog.cancel'.tr(),
            textColor: red,
          ),
        )
      ],
    ),
  );
}
