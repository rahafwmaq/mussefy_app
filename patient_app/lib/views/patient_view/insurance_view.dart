import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/insurance_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/edit_insurance_view.dart';

class InsuranceView extends StatelessWidget {
  const InsuranceView({super.key, this.patient});
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    InsuranceModel insurance = InsuranceModel();

    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'insurance_drawer.app_title'.tr(),
          centerTitle: true,
          widget: IconButton(
              onPressed: () {
                context.pushView(
                  view: EditInsuranceView(
                    patient: patient!,
                    insurance: insurance,
                  ),
                  then: (p0) {
                    if (p0 == "back") {
                      context
                          .read<PatientBloc>()
                          .add(GetdataEvent(patient!.id!, patient!, ''));
                    }
                  },
                );
              },
              icon: const Icon(Icons.mode_edit_outlined))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: BlocBuilder<PatientBloc, PatientBlocSatet>(
                builder: (context, state) {
                  if (state is GetInsuranceState) {
                    if (state.insuranceModel != null) {
                      insurance = state.insuranceModel!;
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: red),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'insurance_drawer.hint_title'.tr(),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      height10,
                      TextWidget(
                        text: 'insurance_drawer.company_name'.tr(),
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: insurance.companyName ?? "",
                        fontSize: 18,
                        textColor: gray,
                      ),
                      height10,
                      TextWidget(
                        text: 'insurance_drawer.patient_insurens_id'.tr(),
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: insurance.patientInsuranceId ?? "",
                        fontSize: 18,
                        textColor: gray,
                      ),
                      height10,
                      TextWidget(
                        text: 'insurance_drawer.coverage'.tr(),
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: insurance.coverage ?? "",
                        fontSize: 18,
                        textColor: gray,
                      ),
                      height10,
                      TextWidget(
                        text: 'insurance_drawer.contact'.tr(),
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: insurance.contacts ?? "",
                        fontSize: 18,
                        textColor: gray,
                      ),
                      height10,
                      TextWidget(
                        text: 'insurance_drawer.status'.tr(),
                        fontSize: 18,
                      ),
                      TextWidget(
                        text: insurance.status ?? "",
                        fontSize: 18,
                        textColor: gray,
                      )
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
