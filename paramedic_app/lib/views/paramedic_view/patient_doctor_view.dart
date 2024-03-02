import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/models/doctor_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/appbar.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/text.dart';

class PatientDoctorView extends StatefulWidget {
  const PatientDoctorView({Key? key, required this.patientId})
      : super(key: key);
  final String patientId;

  @override
  _PatientDoctorViewState createState() => _PatientDoctorViewState();
}

class _PatientDoctorViewState extends State<PatientDoctorView> {
  Patient? currentPatient;
  Doctor? currentDoctor;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPatientAndDoctorData();
  }

  Future<void> loadPatientAndDoctorData() async {
    try {
      // Load patient data
      var patient = await SupaGetAndDelete()
          .getPatientById(widget.patientId); // Replace with actual patient ID
      Doctor? doctor;
      if (patient != null && patient.doctorId != null) {
        // Load doctor data
        doctor = await SupaGetAndDelete().getDoctorById(patient.doctorId!);
      }
      // Call setState to update the UI
      setState(() {
        currentPatient = patient;
        currentDoctor = doctor;
        isLoading = false;
      });
    } catch (error) {
      setState(() => isLoading = false);
      // Handle any errors here, such as showing a dialog or a snackbar
      print('Error loading data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBarWidget(
          context, 'my_doctor_view.title_screen'.tr(), Container()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SizedBox(
            height: context.getHeight(),
            width: context.getWidth(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentPatient != null)
                  // TextW(text: 'Patient Name: ${currentPatient!.fullName}'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/doctor.png",
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextW(
                              text: 'Practice Name : ',
                              fontSizeText: 20,
                            ),
                            TextW(
                              text: '${currentDoctor!.name}',
                              fontSizeText: 18,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                height10,
                const Divider(),
                height10,
                TextW(
                  text: 'my_doctor_view.practice_id'.tr(),
                  fontSizeText: 18,
                ),
                const TextW(
                  text: '1808318',
                  fontSizeText: 18,
                  colorText: gray,
                ),
                height10,
                TextW(
                  text: 'my_doctor_view.practice_specialty'.tr(),
                  fontSizeText: 18,
                ),
                TextW(
                  text: '${currentDoctor!.speciality}',
                  fontSizeText: 18,
                  colorText: gray,
                ),
                height10,
                TextW(
                  text: 'my_doctor_view.practice_address'.tr(),
                  fontSizeText: 18,
                ),
                TextW(
                  text: '${currentDoctor!.address}',
                  fontSizeText: 18,
                  colorText: gray,
                ),
                height10,
                TextW(
                  text: 'my_doctor_view.practice_contact'.tr(),
                  fontSizeText: 18,
                ),
                TextW(
                  text: '${currentDoctor!.phone}',
                  fontSizeText: 18,
                  colorText: gray,
                ),
                TextW(
                  text: '${currentDoctor!.email}',
                  fontSizeText: 18,
                  colorText: gray,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
