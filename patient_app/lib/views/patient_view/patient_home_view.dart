import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_widgets/container_text_and_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/get_first_word.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/ask_ai_view.dart';
import 'package:mussefy_app/views/patient_view/drawer_view.dart';
import 'package:mussefy_app/views/patient_view/emergency_contact_view.dart';
import 'package:mussefy_app/views/patient_view/insurance_view.dart';
import 'package:mussefy_app/views/patient_view/medical_history_card.dart';
import 'package:mussefy_app/views/patient_view/patient_card.dart';
import 'package:mussefy_app/views/patient_view/what_is_it.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    context.read<PatientBloc>().add(GetPatientInfoCardEvent(patient));
    final firstName = getFirstWords(patient.fullName!);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 35, color: red),
      ),
      drawer: DrawerView(
        patient: patient,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text:
                        '${'patient_home_screen.welcoming_word'.tr()}, $firstName',
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  height10,
                  TextWidget(
                    text: 'patient_home_screen.patient_card_title'.tr(),
                    fontSize: 20,
                  ),
                  height20,
                  Center(
                    child: PatientCard(
                      patient: patient,
                    ),
                  ),
                  height20,
                  TextWidget(
                    text: 'patient_home_screen.medical_services'.tr(),
                    fontSize: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BlocListener<PatientBloc, PatientBlocSatet>(
                          listener: (context, state) {
                            if (state is BringContactListState) {
                              context.pushView(
                                  view: EmergencyContactView(
                                patient: patient,
                                contactList: state.contacts,
                              ));
                            }
                          },
                          child: ContainerTextAndImageWidget(
                            imagePath: 'assets/images/emergency_contact.png',
                            title: 'drawer_widget.emergency_contact'.tr(),
                            onTap: () {
                              context.read<PatientBloc>().add(
                                  GetEmergencyContactEvent(patient: patient));
                            },
                          ),
                        ),
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/AI_ask.png',
                          title: "تحدث مع طبيبك",
                          onTap: () {
                            context.pushView(view: const AskAIView());
                          },
                        ),
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/AI_ask.png',
                          title: "اسال الصيدلي",
                          onTap: () {
                            context.pushView(view: const WhatIsThis());
                          },
                        ),
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/assurance.png',
                          title: 'insurance_drawer.title'.tr(),
                          onTap: () {
                            context.pushView(
                                view: InsuranceView(
                              patient: patient,
                            ));

                            context
                                .read<PatientBloc>()
                                .add(GetInsuranceEvent(patient));
                          },
                        ),
                      ],
                    ),
                  ),
                  TextWidget(
                    text: 'patient_home_screen.patient_history_title'.tr(),
                    fontSize: 20,
                  ),
                  height20,
                  MedicalHistoryCard(
                    patient: patient,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
