import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/models/paramedic_model.dart';
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

class ParamedicHomeView extends StatelessWidget {
  ParamedicHomeView({super.key, required this.paramedic});
  final Paramedic paramedic;

  final TextEditingController patientIDController = TextEditingController();

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
                          color: red,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.removeUntil(view: ParamedicLoginView());
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: red,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const ParamedicProfilePic(),
                  height10,
                  TextWidget(
                    text: '${'ParamedicRegistrationScreen.ID'.tr()} 101',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: paramedic.name!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    text: paramedic.email!,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  TextWidget(
                    text: paramedic.hospital!,
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
                    onTap: () {
                      context.pushView(
                          view: PatientViewForParamedic(
                        idText: patientIDController.text,
                      ));
                    },
                    color: blueTransit,
                    text: 'ParamedicRegistrationScreen.buttonText'.tr(),
                    textColor: white,
                    fontSize: 20,
                  ),
                  height20,
                  TextWidget(
                    text: 'ParamedicRegistrationScreen.or'.tr(),
                    fontSize: 20,
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
                        onTap: () {},
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
