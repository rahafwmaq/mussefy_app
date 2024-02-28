import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class ParamedicProfilePic extends StatelessWidget {
  const ParamedicProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: red, width: 5),
          borderRadius: BorderRadius.circular(100)),
      child: ClipOval(
        child: Image.asset(
          'assets/images/peremedic_profile_pic.png',
          height: context.getHeight(divide: 6),
        ),
      ),
    );
  }
}
