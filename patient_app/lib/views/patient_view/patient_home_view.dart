import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_text_and_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
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
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 35, color: red),
      ),
      drawer: const DrawerView(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: 'text'),
                  const TextWidget(text: 'text'),
                  const Center(child: PatientCard()),
                  height20,
                  const TextWidget(text: 'text'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/emergency_contact.png',
                          title: 'drawer_widget.emergency_contact'.tr(),
                          onTap: () {
                            context.pushView(
                                view: const EmergencyContactView());
                          },
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
                            context.pushView(view: const InsuranceView());
                          },
                        ),
                      ],
                    ),
                  ),
                  const TextWidget(text: 'text'),
                  const MedicalHistoryCard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
