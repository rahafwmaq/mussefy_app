// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mussefy_app/view_layout/color.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {super.key,
      required this.hintTextDropDownMenu,
      required this.dropdownItems,
      required this.onSelect,
      required this.dropdownFormKey});

  final String hintTextDropDownMenu;
  final List<DropdownMenuItem<String>> dropdownItems;
  final dropdownFormKey;
  final Function(String?) onSelect;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: dropdownFormKey,
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(20),
          isDense: true,
          menuMaxHeight: 200,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            labelText: hintTextDropDownMenu,
            labelStyle: const TextStyle(color: red),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: red),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: red),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: (value) =>
              value == null ? "Please select from the menu" : null,
          dropdownColor: white,
          onChanged: onSelect,
          iconEnabledColor: red,
          items: dropdownItems),
    );
  }
}
