import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_bloc.dart';
import 'package:mussefy_app/bloc/auth/authintcation_event.dart';
import 'package:mussefy_app/utilities/helpers/loading_screen.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/logo_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_auth_view/patient_login_view.dart';
import 'package:mussefy_app/views/patient_auth_view/patient_otp_view.dart';

class PatientSginupView extends StatelessWidget {
  PatientSginupView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                height20,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: SizedBox(
                    height: context.getHeight(),
                    child: Column(
                      children: [
                        const LogoImage(),
                        height10,
                        Row(
                          children: [
                            TextWidget(
                              text: 'Patient_regestraion_screen.title'.tr(),
                              textColor: red,
                              fontSize: 30,
                            ),
                          ],
                        ),
                        height10,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.text,
                          controller: fullNameController,
                          labelText: 'Patient_regestraion_screen.name'.tr(),
                          labelTextColor: red,
                          controllerTextColor: black,
                          cursorColor: red,
                          obscureText: false,
                          suffixIcon: const Icon(
                            Icons.person,
                            color: red,
                          ),
                        ),
                        height10,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.text,
                          controller: phoneNumberController,
                          labelText: 'Patient_regestraion_screen.phone'.tr(),
                          labelTextColor: red,
                          controllerTextColor: black,
                          cursorColor: red,
                          obscureText: false,
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: red,
                          ),
                        ),
                        height10,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          labelText: 'Patient_regestraion_screen.email'.tr(),
                          labelTextColor: red,
                          controllerTextColor: black,
                          cursorColor: red,
                          obscureText: false,
                          suffixIcon: const Icon(
                            Icons.email,
                            color: red,
                          ),
                        ),
                        height10,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          labelText: 'Patient_regestraion_screen.password'.tr(),
                          labelTextColor: red,
                          controllerTextColor: black,
                          cursorColor: red,
                          obscureText: true,
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: red,
                          ),
                        ),
                        height8,
                        Row(
                          children: [
                            TextWidget(
                                text: 'Patient_regestraion_screen.text1'.tr()),
                            width10,
                            InkWell(
                                onTap: () {
                                  context.pushView(view: PatientLoginView());
                                },
                                child: TextWidget(
                                    text:
                                        'Patient_regestraion_screen.text2'.tr(),
                                    textColor: red,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        height40,
                        BlocListener<AuthintcationBloc, AuthintcationState>(
                          listener: (context, state) {
                            if (state is PatientRegisterationSuccessState) {
                              context.removeUntil(
                                  view: PatientOTPView(
                                email: emailController.text,
                              ));
                            } else if (state is ErrorState) {
                              if (state.stopLoading) {
                                context.popView();
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)));
                            } else if (state is LoadingState) {
                              showLoadingDialog(context);
                            }
                          },
                          child: ClickContainerWidget(
                            onTap: () {
                              context.read<AuthintcationBloc>().add(
                                  PatientRegisterationEvent(
                                      name: fullNameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      phone:
                                          phoneNumberController.text.trim()));
                            },
                            color: blueTransit,
                            text: 'Patient_regestraion_screen.buttonText'.tr(),
                            textColor: white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
