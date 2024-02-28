import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/paramedic_profile_pic.dart';
import 'package:paramedic_app/views/paramedic_view/search_patient_options.dart';

class ParamedicHomeView extends StatelessWidget {
  ParamedicHomeView({super.key});

  final TextEditingController patientIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: context.getWidth(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ParamedicProfilePic(),
              height10,
              const TextWidget(
                text: 'ID : 103',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const TextWidget(
                text: 'Faisal Alshamary',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              const TextWidget(
                text: 'Dr.fisal99@gmail.com',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              const TextWidget(
                text: 'King Abdulaziz Hosital',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              height70,
              Column(
                children: [
                  SearchPatientOptions(
                    onTap: () {},
                    textOption: 'Scan QR',
                    iconPathImage: 'assets/images/scan_qr.png',
                  ),
                  height20,
                  TextWidget(
                    text: 'OR',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  height20,
                  TextFormFieldWidget(
                    keyboardType: TextInputType.text,
                    controller: patientIDController,
                    labelText: 'Patient ID',
                    labelTextColor: red,
                    controllerTextColor: black,
                    cursorColor: red,
                    obscureText: false,
                    suffixIcon: const Icon(
                      Icons.person,
                      color: red,
                    ),
                  ),
                  // SearchPatientOptions(
                  //   onTap: () {},
                  //   textOption: 'Search by ID',
                  //   iconPathImage: 'assets/images/search_id.png',
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
