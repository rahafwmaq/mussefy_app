// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/MedicalInformation_model.dart';
import 'package:mussefy_app/models/allergies_model.dart';
import 'package:mussefy_app/models/chronic_disease_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/drop_down_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

final dropdownIsSmookerFormKey = GlobalKey<FormState>();
String isSmopker = '';

class EditMedicalInfoView extends StatelessWidget {
  EditMedicalInfoView(
      {super.key, required this.patient, this.medicalInformation});
  Patient patient;
  MedicalInformation? medicalInformation;
  TextEditingController medicalDeviceController = TextEditingController();
  TextEditingController communicationChallangeController =
      TextEditingController();
  TextEditingController allergensController = TextEditingController();
  TextEditingController chronicDiseasesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            context: context,
            title: 'drawer_medical_inforamtion.title_screen'.tr(),
            centerTitle: true,
            widget: Container()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height8,
                TextWidget(
                  text: 'edit_medical_info.title'.tr(),
                  fontSize: 20,
                ),
                height18,
                Column(
                  children: [
                    TextFormFieldWidget(
                      controller: chronicDiseasesController,
                      obscureText: false,
                      labelTextColor: red,
                      labelText: 'edit_medical_info.chronic_diseases'.tr(),
                    ),
                    height20,
                    ClickContainerWidget(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: TextWidget(
                                  text: 'edit_medical_info.confirm_mess'.tr()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Center(
                                      child: TextWidget(
                                    text: 'edit_medical_info.ok'.tr(),
                                    textColor: red,
                                  )),
                                ),
                              ],
                            ),
                          );
                          final ChronicDisease chronicDisease = ChronicDisease(
                              disease: chronicDiseasesController.text);
                          print(chronicDiseasesController.text);
                          print(patient.id);
                          context.read<PatientBloc>().add(
                              AddPatientChronicDiseasesEvent(chronicDisease,
                                  patient.id.toString(), patient));
                        },
                        height: 35,
                        width: 100,
                        color: blueTransit,
                        text: 'drawer_account.save'.tr(),
                        textColor: white,
                        fontSize: 15)
                  ],
                ),
                height20,
                Column(
                  children: [
                    TextFormFieldWidget(
                      controller: allergensController,
                      obscureText: false,
                      labelTextColor: red,
                      labelText: 'edit_medical_info.allergens'.tr(),
                    ),
                    height20,
                    ClickContainerWidget(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: TextWidget(
                                  text: 'edit_medical_info.confirm_mess'.tr()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Center(
                                      child: TextWidget(
                                    text: 'edit_medical_info.ok'.tr(),
                                    textColor: red,
                                  )),
                                ),
                              ],
                            ),
                          );
                          final Allergies allergies = Allergies(
                              allergiesName: allergensController.text);
                          context.read<PatientBloc>().add(
                              AddPatientAllergiesEvent(allergies, patient));
                        },
                        height: 35,
                        width: 100,
                        color: blueTransit,
                        text: 'drawer_account.save'.tr(),
                        textColor: white,
                        fontSize: 15)
                  ],
                ),
                height20,
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        height20,
                        TextWidget(
                          text: 'edit_medical_info.hint_title'.tr(),
                          textColor: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        height20,
                        TextFormFieldWidget(
                          controller: communicationChallangeController,
                          obscureText: false,
                          labelTextColor: red,
                          labelText: 'edit_medical_info.communication'.tr(),
                        ),
                        height20,
                        TextFormFieldWidget(
                          controller: medicalDeviceController,
                          obscureText: false,
                          labelTextColor: red,
                          labelText: 'edit_medical_info.medical_device'.tr(),
                        ),
                        height20,
                        DropDownWidget(
                          dropdownFormKey: dropdownIsSmookerFormKey,
                          hintTextDropDownMenu:
                              'edit_medical_info.smooker'.tr(),
                          dropdownItems: isSmookerStatus,
                          onSelect: (newValue) {
                            isSmopker = newValue!;
                          },
                        ),
                      ],
                    ),
                    height20,
                    ClickContainerWidget(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: TextWidget(
                                  text: 'edit_medical_info.confirm_mess'.tr()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Center(
                                      child: TextWidget(
                                    text: 'edit_medical_info.ok'.tr(),
                                    textColor: red,
                                  )),
                                ),
                              ],
                            ),
                          );
                          final MedicalInformation medicalInformation2 =
                              MedicalInformation(
                                  communication:
                                      communicationChallangeController.text,
                                  medicalCondition:
                                      medicalDeviceController.text,
                                  isSmoker: isSmopker);
                          if (patient.medicalInformationId == null) {
                            print("dosent have");
                            context.read<PatientBloc>().add(
                                AddPatientMediclaInfoEvent(
                                    medicalInformation2, patient));
                          } else {
                            print(" have");
                            medicalInformation2.id = medicalInformation!.id!;
                            context
                                .read<PatientBloc>()
                                .add(UpdatePatientMedicalInfoInfoEvent(
                                  medicalInformation: medicalInformation2,
                                  patient: patient,
                                ));
                          }
                        },
                        height: 35,
                        width: 100,
                        color: blueTransit,
                        text: 'drawer_account.save'.tr(),
                        textColor: white,
                        fontSize: 15),
                    height20,
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
