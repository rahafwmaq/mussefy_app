import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_event.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/globals/global.dart';
import 'package:paramedic_app/models/paramedic_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/functions/loading_screen.dart';
import 'package:paramedic_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_auth_view/paramedic_login_view.dart';
import 'package:paramedic_app/views/paramedic_view/paramedic_profile_pic.dart';
import 'package:paramedic_app/views/paramedic_view/patient_view_for_paramedic.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ParamedicHomeView extends StatefulWidget {
  const ParamedicHomeView({super.key, required this.paramedic});
  final Paramedic paramedic;

  @override
  State<ParamedicHomeView> createState() => _ParamedicHomeViewState();
}

class _ParamedicHomeViewState extends State<ParamedicHomeView> {
  final TextEditingController patientIDController = TextEditingController();
  bool iserror = false;
  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      if (!mounted) return;

      if (barcodeScanRes != '-1') {
        setState(() {
          patientIDController.text = barcodeScanRes;
          iserror = false;
        });
        fetchAndNavigate();
      }
    } catch (e) {
      setState(() {
        iserror = true;
      });
    }
  }

  Future<void> fetchAndNavigate() async {
    try {
      final Patient myPatient =
          await SupaGetAndDelete().getPatientById(patientIDController.text);

      context.read<PatientBloc>().add(GetPatientInfoCardEvent(myPatient));

      globalCurrentPatient = myPatient;
      print(globalCurrentPatient!.fullName!);
      if (myPatient.id != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientViewForParamedic(
              idText: patientIDController.text,
              patient: globalCurrentPatient!,
            ),
          ),
        );
      }
    } catch (error) {
      print("Error: $error");
      setState(() {
        iserror = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: SafeArea(
        child: SizedBox(
          width: context.getWidth(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (context.locale.toString() == "en_US") {
                              context.setLocale(const Locale('ar', 'SA'));
                            } else {
                              context.setLocale(const Locale('en', 'US'));
                            }
                          },
                          icon: const Icon(
                            Icons.translate_rounded,
                            size: 35,
                          )),
                      IconButton(
                          onPressed: () {
                            context.removeUntil(view: ParamedicLoginView());
                          },
                          icon: const Icon(
                            Icons.logout,
                            size: 35,
                          ))
                    ],
                  ),
                  const ParamedicProfilePic(),
                  height10,
                  TextWidget(
                    text:
                        '${'ParamedicRegistrationScreen.ID'.tr()} ${widget.paramedic.moseefyId}',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: widget.paramedic.name!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    text: widget.paramedic.email!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    text: widget.paramedic.hospital!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  height70,
                  Row(
                    children: [
                      TextWidget(
                        text: 'ParamedicRegistrationScreen.serachby_id'.tr(),
                        fontSize: 18,
                        textColor: red,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  height20,
                  TextFormFieldWidget(
                    keyboardType: TextInputType.text,
                    controller: patientIDController,
                    labelText: 'ParamedicRegistrationScreen.patient_id'.tr(),
                    labelTextColor: red,
                    controllerTextColor: black,
                    cursorColor: red,
                    obscureText: false,
                    suffixIcon: const Icon(
                      Icons.person,
                      color: red,
                    ),
                  ),
                  height20,
                  ClickContainerWidget(
                    onTap: () async {
                      showLoadingDialog(context);
                      fetchAndNavigate();
                    },
                    color: blueTransit,
                    text: 'ParamedicRegistrationScreen.buttonText'.tr(),
                    textColor: white,
                    fontSize: 20,
                  ),
                  height20,
                  TextWidget(
                    text: 'ParamedicRegistrationScreen.or'.tr(),
                    fontSize: 25,
                  ),
                  height20,
                  Row(
                    children: [
                      TextWidget(
                        text: 'ParamedicRegistrationScreen.scan_qr'.tr(),
                        fontSize: 18,
                        textColor: red,
                        fontWeight: FontWeight.bold,
                      ),
                      width80,
                      InkWell(
                        onTap: () async {
                          try {
                            scanBarcode();

                            print(globalCurrentPatient!.fullName!);
                            if (globalCurrentPatient!.fullName != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientViewForParamedic(
                                    idText: patientIDController.text,
                                    patient: globalCurrentPatient!,
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                            setState(() {
                              iserror = true;
                            });
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    Navigator.of(context).pop(true);
                                  });

                                  return const Center(
                                      child: CircularProgressIndicator(
                                          color: red));
                                });
                          }
                        },
                        child: Container(
                          height: context.getHeight(divide: 7),
                          width: context.getWidth(divide: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(color: lightGrey, blurRadius: 10)
                              ],
                              color: white),
                          child: Image.asset(
                            'assets/images/scan_qr.png',
                            color: red,
                            height: context.getHeight(divide: 8),
                            width: context.getWidth(divide: 4),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
