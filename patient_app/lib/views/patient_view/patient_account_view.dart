// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/date_picker_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/drop_down_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

final dropdownBloodTypeFormKey = GlobalKey<FormState>();

class PatientAccount extends StatelessWidget {
  PatientAccount({super.key});

  TextEditingController nationalIdController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? bloodTypeValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            centerTitle: true, title: 'My Account', context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: context.getHeight(divide: 1.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: 'Account Information',
                        fontSize: 20,
                      ),
                      height10,
                      const TextWidget(
                        text:
                            'Please fill out all your personal information. So we can complete your medical card successfully',
                        fontSize: 15,
                      ),
                      height20,
                      TextFormFieldWidget(
                        controller: nationalIdController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        labelText: 'National ID',
                        labelTextColor: red,
                        cursorColor: red,
                        suffixIcon: const Icon(
                          Icons.assignment_ind_outlined,
                          color: red,
                        ),
                      ),
                      height20,
                      TextFormFieldWidget(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        labelText: 'Height',
                        labelTextColor: red,
                        cursorColor: red,
                        suffixIcon: const Icon(
                          Icons.height_rounded,
                          color: red,
                        ),
                      ),
                      height20,
                      TextFormFieldWidget(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        labelText: 'Weight',
                        labelTextColor: red,
                        cursorColor: red,
                        suffixIcon: const Icon(
                          Icons.line_weight_rounded,
                          color: red,
                        ),
                      ),
                      height20,
                      DatePickerWidget(
                        dateController: birthdayController,
                        labelText: 'Date of Birth',
                      ),
                      height20,
                      DropDownWidget(
                        dropdownFormKey: dropdownBloodTypeFormKey,
                        hintTextDropDownMenu: 'Blood Type',
                        dropdownItems: bloodType,
                        onSelect: (newValue) {
                          bloodTypeValue = newValue!;
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: ClickContainerWidget(
                          onTap: () {},
                          color: blueTransit,
                          text: 'Save',
                          textColor: white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
