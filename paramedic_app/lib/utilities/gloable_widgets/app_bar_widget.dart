// import 'package:flutter/material.dart';
// import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
// import 'package:paramedic_app/utilities/helpers/navigator.dart';

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//           title:  TextWidget(
//             text: title,
//           ),
//           leading: IconButton(
//             onPressed: () {
//               context.popView();
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               size: 35,
//             ),
//           ),
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';

AppBar customAppBar({
  required BuildContext context,
  String? title,
  bool? centerTitle,
}) {
  return AppBar(
    title: TextWidget(text: title!),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        context.popView();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 35,
      ),
    ),
  );
}
