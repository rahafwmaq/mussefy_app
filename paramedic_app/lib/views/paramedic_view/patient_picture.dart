import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';

class PatientPicture extends StatelessWidget {
  const PatientPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/images/patient_pic.png',
        height: context.getHeight(divide: 7),
      ),
    );
  }
}
