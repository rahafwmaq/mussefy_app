import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/doctor_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/edit_my_doctor_info_view.dart';
import 'package:mussefy_app/views/patient_view/my_doctor_picture.dart';

class MyDoctorView extends StatelessWidget {
  const MyDoctorView({super.key, required this.patient});
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    Doctor doctor = Doctor();

    return Scaffold(
      appBar: customAppBar(
        title: 'my_doctor_view.title_screen'.tr(),
        context: context,
        widget: IconButton(
          onPressed: () {
            context.pushView(
              view: EditMyDoctorInfoView(
                patient: patient!,
                doctor: doctor,
              ),
              then: (p0) {
                if (p0 == "back") {
                  context.read<PatientBloc>().add(GetdataEvent(
                        patient!.id!,
                        patient!,
                        'My Doctor',
                      ));
                }
              },
            );
          },
          icon: const Icon(Icons.mode_edit_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<PatientBloc, PatientBlocSatet>(
            builder: (context, state) {
              if (state is SucssessPatientDoctorState) {
                if (state.doctor != null) {
                  doctor = state.doctor!;
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: red),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyDoctorPictureAndName(
                    doctor: doctor,
                  ),
                  const Divider(),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_specialty'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.speciality ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_address'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.address ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_contact'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.phone ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  TextWidget(
                    text: doctor.email ?? '',
                    fontSize: 18,
                    textColor: gray,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
