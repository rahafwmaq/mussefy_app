// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';

class DatePickerWidget extends StatelessWidget {
  DatePickerWidget(
      {super.key, required this.dateController, required this.labelText});

  TextEditingController dateController = TextEditingController();
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: dateController,
      obscureText: false,
      cursorColor: red,
      labelTextColor: red,
      labelText: labelText,
      suffixIcon: const Icon(
        Icons.date_range_rounded,
      ),
      onTap: () async {
        await selectDate(context: context, dateController: dateController);
      },
    );
  }
}

Future<String?> selectDate(
    {required BuildContext context,
    required TextEditingController dateController}) async {
  DateTime? pickDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1600),
    lastDate: DateTime.now(),
    cancelText: '',
  );

  if (pickDate != null) {
    dateController.text = pickDate.toString().split(" ")[0];
    return dateController.text;
  }
  return null;
}
