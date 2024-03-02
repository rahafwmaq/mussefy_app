// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/insurance_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_data/data.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/drop_down_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

final dropdownInsuranceStatusFormKey = GlobalKey<FormState>();

class EditInsuranceView extends StatefulWidget {
  const EditInsuranceView(
      {super.key, required this.patient, required this.insurance});
  final Patient patient;
  final InsuranceModel insurance;

  @override
  State<EditInsuranceView> createState() => _EditInsuranceViewState();
}

class _EditInsuranceViewState extends State<EditInsuranceView> {
  TextEditingController companyNameController = TextEditingController();

  TextEditingController patientInsuranceIdController = TextEditingController();

  TextEditingController coverageController = TextEditingController();

  TextEditingController contactsController = TextEditingController();

  String? insuranceStatusValue = '';

  @override
  void initState() {
    companyNameController.text = widget.insurance.companyName ?? '';
    patientInsuranceIdController.text =
        widget.insurance.patientInsuranceId ?? '';
    coverageController.text = widget.insurance.coverage ?? '';
    contactsController.text = widget.insurance.contacts ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'insurance_drawer.app_title'.tr(),
          centerTitle: true,
          widget: Container()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: context.getHeight(divide: 1.30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'insurance_drawer.hint_title'.tr(),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    height10,
                    TextFormFieldWidget(
                      controller: companyNameController,
                      labelText: 'insurance_drawer.edit_company_name'.tr(),
                      obscureText: false,
                    ),
                    height18,
                    TextFormFieldWidget(
                      controller: patientInsuranceIdController,
                      labelText:
                          'insurance_drawer.edit_patient_insurens_id'.tr(),
                      obscureText: false,
                    ),
                    height18,
                    TextFormFieldWidget(
                      controller: coverageController,
                      labelText: 'insurance_drawer.edit_coverage'.tr(),
                      obscureText: false,
                    ),
                    height18,
                    TextFormFieldWidget(
                      controller: contactsController,
                      labelText: 'insurance_drawer.edit_contact'.tr(),
                      obscureText: false,
                    ),
                    height18,
                    DropDownWidget(
                      dropdownFormKey: dropdownInsuranceStatusFormKey,
                      hintTextDropDownMenu: 'insurance_drawer.edit_status'.tr(),
                      dropdownItems: insuranceStatus,
                      onSelect: (newValue) {
                        insuranceStatusValue = newValue!;
                      },
                    ),
                  ],
                ),
                Center(
                  child: ClickContainerWidget(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: TextWidget(
                                text: 'insurance_drawer.confirm_mess'.tr()),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Center(
                                    child: TextWidget(
                                  text: 'insurance_drawer.ok'.tr(),
                                  textColor: red,
                                )),
                              ),
                            ],
                          ),
                        );
                        final insuranceId = widget.insurance.id;
                        // print('dddd ${insurance.id}');
                        final InsuranceModel insurancee = InsuranceModel(
                            companyName: companyNameController.text,
                            patientInsuranceId:
                                patientInsuranceIdController.text,
                            coverage: coverageController.text,
                            contacts: contactsController.text,
                            status: insuranceStatusValue);
                        print('i am in the ui : id =${widget.insurance.id}');
                        print('dddd ${insuranceId}');

                        if (widget.insurance.id == null) {
                          context.read<PatientBloc>().add(
                              AddPatientInsuranceInfoEvent(
                                  insurancee, widget.patient));
                        } else {
                          context.read<PatientBloc>().add(UpdateInsuranceEvent(
                              widget.insurance, widget.patient, insuranceId!));
                        }
                      },
                      color: blueTransit,
                      text: 'drawer_account.save'.tr(),
                      textColor: white,
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                     title:
//                         TextWidget(text: 'insurance_drawer.confirm_mess'.tr()),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Center(
//                             child: TextWidget(
//                           text: 'insurance_drawer.ok'.tr(),
//                           textColor: red,
//                         )),
//                       ),
//                     ],
//                   ),
//                 );
//                 final insuranceId = insurance.id;
//                 // print('dddd ${insurance.id}');
//                 final InsuranceModel insurancee = InsuranceModel(
//                     companyName: companyNameController.text,
//                     patientInsuranceId: patientInsuranceIdController.text,
//                     coverage: coverageController.text,
//                     contacts: contactsController.text,
//                     status: insuranceStatusValue);
//                 print('i am in the ui : id =${insurance.id}');
//                 print('dddd ${insuranceId}');

//                 if (insurance.id == null) {
//                   context
//                       .read<PatientBloc>()
//                       .add(AddPatientInsuranceInfoEvent(insurancee, patient));
//                 } else {
//                   context.read<PatientBloc>().add(
//                       UpdateInsuranceEvent(insurance, patient, insuranceId!));
//                 }
//               },
//               child: TextWidget(
//                 text: 'drawer_account.save'.tr(),
//                 textColor: red,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),