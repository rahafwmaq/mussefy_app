// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/MobilityProblem_model.dart';
import 'package:mussefy_app/models/patient.dart';
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

final dropdownMobilityProblrmTypeFormKey = GlobalKey<FormState>();
final dropdownMobilityProblrmPlacementFormKey = GlobalKey<FormState>();

class AddNewMobilityProblem extends StatelessWidget {
  AddNewMobilityProblem(
      {super.key,
      required this.problemNameController,
      required this.problemDescriptionController,
      required this.nameLabelText,
      required this.titleAddInfo,
      required this.onPressed,
      this.mobilityType,
      this.mobilityPlace,
      this.patient});

  TextEditingController problemNameController;
  TextEditingController problemDescriptionController;
  final String nameLabelText;
  final String titleAddInfo;
  final Function() onPressed;
  String? mobilityType;
  String? mobilityPlace;
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
                    // height: context.getHeight(),
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
                            controller: problemNameController,
                            labelText: nameLabelText,
                            obscureText: false,
                          ),
                          height20,
                          DropDownWidget(
                            dropdownFormKey: dropdownMobilityProblrmTypeFormKey,
                            hintTextDropDownMenu:
                                'dropDownPhysicalProblrmType.hint_text_type'
                                    .tr(),
                            dropdownItems: physicalProblrmType,
                            onSelect: (newValue) {
                              mobilityType = newValue;
                            },
                          ),
                          height20,
                          DropDownWidget(
                            dropdownFormKey:
                                dropdownMobilityProblrmPlacementFormKey,
                            hintTextDropDownMenu:
                                'dropDownPlacementIssue.hint_text_physical_place'
                                    .tr(),
                            dropdownItems: placementIssue,
                            onSelect: (newValue) {
                              mobilityPlace = newValue;
                            },
                          ),
                          height30,
                          Center(
                            child: ClickContainerWidget(
                              height: context.getWidth(divide: 10),
                              width: context.getWidth(divide: 3),
                              onTap: () {
                                context.popView();
                                print("1");
                                print(problemNameController.text);
                                print(mobilityType);
                                print(mobilityPlace);
                                if (problemNameController.text.isNotEmpty &&
                                    mobilityType != null &&
                                    mobilityPlace != null) {
                                  print("2");

                                  final MobilityProblem mobilityProblem =
                                      MobilityProblem(
                                          problemName:
                                              problemNameController.text,
                                          problemType: mobilityType,
                                          problemPlace: mobilityPlace,
                                          patientId: patient!.id);
                                  print("3");

                                  context.read<PatientBloc>().add(
                                      AddPatientMobilityProblemEvent(
                                          mobilityProblem,
                                          patient!.id.toString(),
                                          patient!));
                                } else {
                                  return showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: TextWidget(
                                          text:
                                              'Patient_regestraion_screen.validatorMessage2'
                                                  .tr()),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Center(
                                              child: TextWidget(
                                            text: 'my_doctor_view.OK'.tr(),
                                            textColor: red,
                                          )),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                problemNameController.clear();
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
        icon: const Icon(Icons.add));
  }
}
