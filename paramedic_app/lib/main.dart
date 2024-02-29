import 'package:flutter/material.dart';
//import 'package:paramedic_app/views/logo_view/logo_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_view_for_paramedic.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            //LogoView()
            PatientViewForParamedic());
  }
}
