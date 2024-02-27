import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/logo_image.dart';
import 'package:mussefy_app/utilities/gloable_widgets/previous_icon_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/paramedic_view/paramedic_home_view/paramedic_home_view.dart';
import 'package:mussefy_app/views/patient_view/patient_auth_view/patient_sginup_view.dart';

class PatientLoginView extends StatelessWidget {
  PatientLoginView({super.key});

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
                const PreviousPageIconWidget(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: SizedBox(
                    height: context.getHeight(),
                    child: Column(
                      children: [
                        const LogoImage(),
                        height10,
                        const Row(
                          children: [
                            TextWidget(
                              text: 'Login',
                              textColor: red,
                              fontSize: 30,
                            ),
                          ],
                        ),
                        height10,
                        TextFormFieldWidget(
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          labelText: 'Email',
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
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          labelText: 'Password',
                          labelTextColor: red,
                          controllerTextColor: black,
                          cursorColor: red,
                          obscureText: true,
                          suffixIcon: const Icon(
                            Icons.person,
                            color: red,
                          ),
                        ),
                        height8,
                        Row(
                          children: [
                            const TextWidget(
                                text: 'You don\'t have an account ?'),
                            width10,
                            InkWell(
                                onTap: () {
                                  context.pushView(view: PatientSginupView());
                                },
                                child: const TextWidget(
                                    text: 'Create account',
                                    textColor: red,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        height40,
                        ClickContainerWidget(
                          onTap: () {
                            context.removeUntil(
                                view: const ParamedicHomeView());
                          },
                          color: blueTransit,
                          text: 'Login',
                          textColor: white,
                          fontSize: 22,
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
