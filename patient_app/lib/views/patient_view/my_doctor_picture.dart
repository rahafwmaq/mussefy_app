import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/models/doctor_model.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class MyDoctorPictureAndName extends StatelessWidget {
  const MyDoctorPictureAndName({super.key, required this.doctor});

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
              "assets/images/doctor.png",
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
