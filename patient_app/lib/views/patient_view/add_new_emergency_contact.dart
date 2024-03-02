// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/EmergencyContact_model.dart';

import 'package:mussefy_app/models/patient_model.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/drop_down_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

final dropdownRelationshipToPatientFormKey2 = GlobalKey<FormState>();

class AddNewEmergency extends StatelessWidget {
  AddNewEmergency({super.key, required this.titleAddInfo, this.patient});

  TextEditingController emergencyNameController = TextEditingController();
  TextEditingController emergencyPhoneController = TextEditingController();
  String? relationship;

  final String titleAddInfo;
  final Patient? patient;

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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            cursorColor: red,
                            labelTextColor: red,
                            controller: emergencyNameController,
                            labelText:
                                'drawer_emergency_contact.emergency_name'.tr(),
                            obscureText: false,
                          ),
                          height20,
                          TextFormFieldWidget(
                            cursorColor: red,
                            labelTextColor: red,
                            controller: emergencyPhoneController,
                            labelText:
                                'drawer_emergency_contact.emergency_phone'.tr(),
                            obscureText: false,
                          ),
                          height20,
                          DropDownWidget(
                            dropdownFormKey:
                                dropdownRelationshipToPatientFormKey2,
                            hintTextDropDownMenu:
                                'drawer_emergency_contact.relation'.tr(),
                            dropdownItems: relationshipToPatient,
                            onSelect: (newValue) {
                              relationship = newValue!;
                            },
                          ),
                          height30,
                          Center(
                            child: ClickContainerWidget(
                              height: context.getWidth(divide: 10),
                              width: context.getWidth(divide: 3),
                              onTap: () {
                                context.popView();
                                final EmergencyContact emergencyContact =
                                    EmergencyContact(
                                        name:
                                            emergencyNameController.text.trim(),
                                        phoneNumber: emergencyPhoneController
                                            .text
                                            .trim(),
                                        relationshipType: relationship);

                                context.read<PatientBloc>().add(
                                    AddEmergencyContactEvent(
                                        emergencyContact, patient!));

                                emergencyNameController.clear();
                                emergencyPhoneController.clear();
                              },
                              color: blueTransit,
                              text: 'add_new_info_model_sheet_widget.send_add'
                                  .tr(),
                              textColor: white,
                              fontSize: 20,
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
          Icons.add_ic_call_rounded,
          size: 35,
        ));
  }
}
