import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_widgets/container_text_and_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/drawer_view.dart';
import 'package:mussefy_app/views/patient_view/medical_history_card.dart';
import 'package:mussefy_app/views/patient_view/patient_card.dart';

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
                          onTap: () {},
                        ),
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/AI_ask.png',
                          title: 'AI.title'.tr(),
                          onTap: () {},
                        ),
                        ContainerTextAndImageWidget(
                          imagePath: 'assets/images/assurance.png',
                          title: 'insurance_drawer.title'.tr(),
                          onTap: () {},
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
