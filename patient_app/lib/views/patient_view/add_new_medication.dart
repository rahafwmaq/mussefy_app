// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class AddNewMedication extends StatelessWidget {
  AddNewMedication(
      {super.key,
      required this.medicationUnitController,
      required this.medicationNameController,
      required this.medicationTimeController,
      required this.nameLabelText,
      required this.titleAddInfo,
      required this.onPressed,
      required this.unitLabelText,
      required this.timeLabelText});

  TextEditingController medicationUnitController;
  TextEditingController medicationNameController;
  TextEditingController medicationTimeController;
  final String nameLabelText;
  final String unitLabelText;
  final String timeLabelText;

  final String titleAddInfo;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ContainerWidget(
                    // height: context.getHeight(divide: 1.50),
                    width: context.getWidth(),
                    borderColor: noColor,
                    borderWidth: 0,
                    borderRadius: 20,
                    containerColor: noColor,
                    blurRadius: 0,
                    shadowColor: noColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: TextWidget(
                              text: titleAddInfo,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height30,
                          TextWidget(
                            text: 'add_new_info_model_sheet_widget.title_widget'
                                .tr(),
                            fontSize: 20,
                          ),
                          height20,
                          TextFormFieldWidget(
                            controller: medicationNameController,
                            labelText: nameLabelText,
                            obscureText: false,
                          ),
                          height20,
                          TextFormFieldWidget(
                            controller: medicationUnitController,
                            labelText: unitLabelText,
                            obscureText: false,
                          ),
                          height20,
                          TextFormFieldWidget(
                            controller: medicationTimeController,
                            labelText: timeLabelText,
                            obscureText: false,
                          ),
                          height30,
                          Center(
                            child: ClickContainerWidget(
                              height: context.getWidth(divide: 10),
                              width: context.getWidth(divide: 3),
                              text: 'add_new_info_model_sheet_widget.send_add'
                                  .tr(),
                              color: blueTransit,
                              textColor: white,
                              fontSize: 20,
                              onTap: onPressed,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        icon: const Icon(
          Icons.medication_liquid,
          size: 35,
        ));
  }
}
