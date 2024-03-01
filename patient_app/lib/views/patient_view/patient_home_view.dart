import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/drawer_view.dart';
import 'package:mussefy_app/views/patient_view/medical_history_card.dart';
import 'package:mussefy_app/views/patient_view/patient_card.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 35, color: red),
      ),
      drawer: const DrawerView(),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'text'),
                  TextWidget(text: 'text'),
                  PatientCard(),
                  TextWidget(text: 'text'),
                  MedicalHistoryCard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
