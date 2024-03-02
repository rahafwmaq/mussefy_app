// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/utilities/gloable_data/globals.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/date_picker_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/file_picker_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

// this custom widget for adding
// - new Sergury
// - new X-Rays
// - new Lab Result

class AddNewInfoModelSheetWidget extends StatelessWidget {
  AddNewInfoModelSheetWidget(
      {super.key,
      required this.prosessDateController,
      required this.prosessNameController,
      required this.nameLabelText,
      required this.dateLabelText,
      required this.titleAddInfo,
      required this.onPressed,
      this.dropDownWidget,
      required this.type});

  TextEditingController prosessDateController;
  TextEditingController prosessNameController;
  final String nameLabelText;
  final String dateLabelText;
  final String titleAddInfo;
  final Function() onPressed;
  final Widget? dropDownWidget;
  final String type;

  @override
  Widget build(BuildContext context) {
    File? fileee;
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
                      top: 80,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ContainerWidget(
                    height: context.getHeight(divide: 1.5),
                    width: context.getWidth(),
                    borderColor: noColor,
                    borderWidth: 0,
                    borderRadius: 20,
                    containerColor: noColor,
                    blurRadius: 0,
                    shadowColor: noColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: TextWidget(
                              text: titleAddInfo,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height10,
                          TextWidget(
                            text: 'add_new_info_model_sheet_widget.title_widget'
                                .tr(),
                            fontSize: 20,
                          ),
                          height20,
                          TextFormFieldWidget(
                            controller: prosessNameController,
                            obscureText: false,
                            labelTextColor: red,
                            labelText: nameLabelText,
                          ),
                          height20,
                          DatePickerWidget(
                            labelText: dateLabelText,
                            dateController: prosessDateController,
                          ),
                          height20,
                          Container(
                            child: dropDownWidget,
                          ),
                          height20,
                          Center(
                            child: FilePickerWidget(
                              onPressed: () async {
                                print("here");
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();
                                if (result != null) {
                                  fileee = File(result.files.single.path!);
                                }
                              },
                            ),
                          ),
                          Spacer(),
                          Center(
                            child: ClickContainerWidget(
                              onTap: () {
                                if (prosessDateController.text.isEmpty ||
                                    prosessNameController.text.isEmpty ||
                                    fileee == null) {
                                  showDialog(
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
                                } else {
                                  if (type == 'xray_reports') {
                                    print('here=======');
                                    context.read<PatientBloc>().add(
                                        UploadXrayReportEvent(
                                            date: prosessDateController.text,
                                            name: prosessNameController.text,
                                            pdfFile: fileee ?? File(""),
                                            patient: globalCurrentPatient!));
                                  } else if (type == 'surgery_reports') {
                                    context.read<PatientBloc>().add(
                                        UploadSurgeryReportEvent(
                                            date: prosessDateController.text,
                                            name: prosessNameController.text,
                                            pdfFile: fileee ?? File(""),
                                            patient: globalCurrentPatient!));
                                  }
                                  context.popView();
                                }
                              },
                              text: 'add_new_info_model_sheet_widget.send_add'
                                  .tr(),
                              color: blueTransit,
                              textColor: white,
                              fontSize: 20,
                            ),
                          ),
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
          Icons.post_add_rounded,
          size: 35,
        ));
  }
}
