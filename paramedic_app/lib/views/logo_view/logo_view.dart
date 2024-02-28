import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/views/paramedic_auth_view/paramedic_login_view.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.removeUntil(view:  ParamedicLoginView());
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.gif'),
      ),
    );
  }
}
