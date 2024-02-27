import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/click_container_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_form_field_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/patient_auth_view/patient_login_view.dart';
import 'package:mussefy_app/views/patient_view/patient_auth_view/patient_otp_view.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: SizedBox(
                height: context.getHeight(),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/mussefy_logo.png',
                      width: 250,
                    ),
                    const TextWidget(
                      text: 'مسعفي',
                      textColor: red,
                      fontSize: 40,
                    ),
                    const TextWidget(
                      text: 'الثواني الأولى تشكل الفرق',
                      textColor: blue,
                      fontSize: 25,
                    ),
                    height10,
                    const Row(
                      children: [
                        TextWidget(
                          text: 'Sgin Up',
                          textColor: red,
                          fontSize: 30,
                        ),
                      ],
                    ),
                    height10,
                    TextFormFieldWidget(
                      keyboardType: TextInputType.text,
                      controller: fullNameController,
                      labelText: 'Full Name',
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
                      labelText: 'Phone Number',
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
                      labelText: 'Email',
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
                      controller: emailController,
                      labelText: 'Password',
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
                        const TextWidget(text: 'You alredy have an account ?'),
                        width10,
                        InkWell(
                            onTap: () {
                              context.pushView(view: PatientLoginView());
                            },
                            child: const TextWidget(
                                text: 'Login',
                                textColor: red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    height40,
                    ClickContainerWidget(
                      onTap: () {
                        context.removeUntil(
                            view: PatientOTPView(
                          email: emailController.text,
                        ));
                      },
                      color: blueTransit,
                      text: 'Sgin Up',
                      textColor: white,
                      fontSize: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
