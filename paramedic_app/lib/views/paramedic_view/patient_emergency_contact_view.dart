import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';

class PatientEmergencyContactView extends StatelessWidget {
  const PatientEmergencyContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Emergency Contacts'),
      body: Center(
        child: TextWidget(text: 'text'),
      ),
    );
  }
}
