import 'package:flutter/material.dart';
import 'package:mussefy_app/views/onboarding_view/logo_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoView()
    );
  }
}
