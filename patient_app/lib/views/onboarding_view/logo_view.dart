import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/views/patient_auth_view/patient_login_view.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.removeUntil(view:  PatientLoginView());
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.gif'),
      ),
    );
  }
}
