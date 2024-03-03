import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/models/doctor_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class DoctorPictureAndName extends StatelessWidget {
  const DoctorPictureAndName({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/patient_doctor.png',
              scale: 8,
            ),
          ),
          width10,
          SizedBox(
            width: context.getWidth(divide: 1.95),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'my_doctor_view.practice_name'.tr(),
                  fontSize: 20,
                ),
                TextWidget(
                  text: doctor.name ?? '',
                  fontSize: 18,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
