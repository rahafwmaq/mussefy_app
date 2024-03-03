import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/MedicalInformation_model.dart';
import 'package:paramedic_app/models/PersonalInfo_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/allergens_container.dart';
import 'package:paramedic_app/views/paramedic_view/chronic_disease_container.dart';
import 'package:paramedic_app/views/paramedic_view/patient_information_container.dart';

class PatientMedicalInformationView extends StatelessWidget {
  const PatientMedicalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalInfo personalInfo = PersonalInfo();
    MedicalInformation medicalInformation = MedicalInformation();
    Patient patient = Patient();

    return Scaffold(
      appBar: customAppBar(
        title: 'medical_inforamtion.title_screen'.tr(),
        context: context,
      ),
      body: SizedBox(
        width: context.getWidth(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: BlocBuilder<PatientBloc, PatientBlocSatet>(
              builder: (context, state) {
                if (state is SucssessPatientDataState) {
                  personalInfo = state.personalInfo;
                  medicalInformation = state.medicalInformation;
                  patient = state.patient;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'medical_inforamtion.patient_information'.tr(),
                        fontSize: 22,
                      ),
                      height20,
                      PatientInfoContainer(
                        personalInfo: personalInfo,
                        patient: state.patient,
                        medicalInformation: state.medicalInformation,
                      ),
                      const Divider(
                        indent: 2,
                      ),
                      height20,
                      TextWidget(
                        text: 'medical_inforamtion.chronic_disease'.tr(),
                        fontSize: 22,
                      ),
                      height20,
                      ChronicDiseaseContainer(
                        chronicDisease: state.chronicDisease,
                        patient: patient,
                      ),
                      const Divider(
                        indent: 2,
                      ),
                      height20,
                      TextWidget(
                        text: 'medical_inforamtion.allergens'.tr(),
                        fontSize: 22,
                      ),
                      height20,
                      AllergensContainer(
                        allergies: state.allergies,
                        patient: patient,
                      ),
                      height30,
                    ],
                  );
                } else {
                  return SizedBox(
                    height: context.getHeight(divide: 1.50),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: red,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
