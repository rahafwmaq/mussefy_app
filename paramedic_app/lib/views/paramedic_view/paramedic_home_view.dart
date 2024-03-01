import 'package:flutter/material.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/globals/global.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/paramedic_profile_pic.dart';
import 'package:paramedic_app/views/paramedic_view/patient_view_for_paramedic.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ParamedicHomeView extends StatefulWidget {
  ParamedicHomeView({super.key});

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
      globalCurrentPatient = myPatient;
      print(globalCurrentPatient!.fullName!);
      if (myPatient.id != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PatientViewForParamedic(idText: patientIDController.text),
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
                  const Row(
                    children: [
                      TextWidget(
                        text: 'Search by Patient ID :',
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
                  height20,
                  ClickContainerWidget(
                    onTap: () {
                      context.pushView(
                          view: const PatientViewForParamedic(
                        idText: "1abe2dce-529f-49dd-8b1d-c3f7af31233d",
                      ));
                    },
                    color: blueTransit,
                    text: 'Submit',
                    textColor: white,
                    fontSize: 20,
                  ),
                  height20,
                  const TextWidget(text: 'OR'),
                  height20,
                  Row(
                    children: [
                      const TextWidget(
                        text: 'Scan QR Code :',
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
                                      idText: patientIDController.text),
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
