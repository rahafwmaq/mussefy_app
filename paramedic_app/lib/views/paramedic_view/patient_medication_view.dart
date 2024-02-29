import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';

class PatientMedicationView extends StatelessWidget {
  const PatientMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Medications'),
      body: Center(
        child: TextWidget(text: 'text'),
      ),
    );
  }
}
