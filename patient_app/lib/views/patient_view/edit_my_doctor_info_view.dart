// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/doctor_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class EditMyDoctorInfoView extends StatefulWidget {
  const EditMyDoctorInfoView(
      {super.key, required this.patient, required this.doctor});
  final Patient patient;
  final Doctor doctor;

  @override
  State<EditMyDoctorInfoView> createState() => _EditMyDoctorInfoViewState();
}

class _EditMyDoctorInfoViewState extends State<EditMyDoctorInfoView> {
  TextEditingController doctorNameController = TextEditingController();

  TextEditingController doctorSpecialtyController = TextEditingController();

  TextEditingController doctorAddressController = TextEditingController();

  TextEditingController doctorEmailController = TextEditingController();

  TextEditingController doctorPhoneNumberController = TextEditingController();

  @override
  void initState() {
    doctorNameController.text = widget.doctor.name ?? '';
    doctorSpecialtyController.text = widget.doctor.speciality ?? '';
    doctorAddressController.text = widget.doctor.address ?? '';
    doctorEmailController.text = widget.doctor.email ?? '';
    doctorPhoneNumberController.text = widget.doctor.phone ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            context: context,
            widget: Container(),
            title: 'drawer_my_doctor.title_screen'.tr(),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: context.getHeight(divide: 1.30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'drawer_my_doctor.title_screen'.tr(),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      height8,
                      TextWidget(
                        text: 'my_doctor_view.description'.tr(),
                      ),
                      height18,
                      TextFormFieldWidget(
                        controller: doctorNameController,
                        labelText: 'my_doctor_view.doctor_name'.tr(),
                        obscureText: false,
                      ),
                      height18,
                      TextFormFieldWidget(
                        controller: doctorSpecialtyController,
                        labelText: 'my_doctor_view.doctor_specialty'.tr(),
                        obscureText: false,
                      ),
                      height18,
                      TextFormFieldWidget(
                        controller: doctorAddressController,
                        labelText: 'my_doctor_view.doctor_address'.tr(),
                        obscureText: false,
                      ),
                      height18,
                      TextFormFieldWidget(
                        controller: doctorEmailController,
                        labelText: 'my_doctor_view.doctor_email'.tr(),
                        obscureText: false,
                      ),
                      height18,
                      TextFormFieldWidget(
                        controller: doctorPhoneNumberController,
                        labelText: 'my_doctor_view.doctor_phone'.tr(),
                        obscureText: false,
                      ),
                    ],
                  ),
                  Center(
                    child: ClickContainerWidget(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: TextWidget(
                                  text: 'my_doctor_view.confirm_mess'.tr()),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Center(
                                      child: TextWidget(
                                    text: 'my_doctor_view.OK'.tr(),
                                    textColor: red,
                                  )),
                                ),
                              ],
                            ),
                          );

                          final Doctor doctor = Doctor(
                              name: doctorNameController.text,
                              speciality: doctorSpecialtyController.text,
                              address: doctorAddressController.text,
                              email: doctorEmailController.text,
                              phone: doctorPhoneNumberController.text);

                          if (doctor.id == null) {
                            context.read<PatientBloc>().add(
                                AddPatientDoctorInfoEvent(
                                    doctor, widget.patient));
                          } else {
                            context.read<PatientBloc>().add(
                                UpdateDoctorInfoEvent(doctor, widget.patient));
                          }
                        },
                        color: blueTransit,
                        text: 'drawer_account.save'.tr(),
                        textColor: white,
                        fontSize: 18),
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
