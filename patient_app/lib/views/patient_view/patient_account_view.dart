// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/PersonalInfo_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

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
  PatientAccount({super.key, required this.patient});
  final Patient patient;

  TextEditingController nationalIdController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? bloodTypeValue;

  @override
  Widget build(BuildContext context) {
    PersonalInfo personalInfo = PersonalInfo();
    nationalIdController.text = personalInfo.nationalId ?? '';
    birthdayController.text = personalInfo.birthday ?? '';

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            centerTitle: true,
            title: 'drawer_account.title_screen'.tr(),
            context: context,
            widget: Container()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: context.getHeight(divide: 1.28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'drawer_account.title'.tr(),
                        fontSize: 20,
                      ),
                      height10,
                      TextWidget(
                        text: 'drawer_account.hint_title'.tr(),
                        fontSize: 15,
                      ),
                      height20,
                      TextFormFieldWidget(
                        controller: nationalIdController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        labelText: 'drawer_account.national_id'.tr(),
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
                        labelText: 'drawer_account.height'.tr(),
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
                        labelText: 'drawer_account.weight'.tr(),
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
                        labelText: 'drawer_account.birthday'.tr(),
                      ),
                      height20,
                      DropDownWidget(
                        dropdownFormKey: dropdownBloodTypeFormKey,
                        hintTextDropDownMenu: 'drawer_account.blood_type'.tr(),
                        dropdownItems: bloodType,
                        onSelect: (newValue) {
                          bloodTypeValue = newValue!;
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: ClickContainerWidget(
                      onTap: () {},
                      color: blueTransit,
                      text: 'drawer_account.save'.tr(),
                      textColor: white,
                      fontSize: 18,
                    ),
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
