import 'package:flutter/material.dart';
import 'package:mussefy_app/view_layout/color.dart';

class SelectUserView extends StatelessWidget {
  const SelectUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.translate,
                    size: 35,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
