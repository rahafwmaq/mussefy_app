import 'package:flutter/material.dart';
import 'package:paramedic_app/views/logo_view/logo_view.dart';

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
