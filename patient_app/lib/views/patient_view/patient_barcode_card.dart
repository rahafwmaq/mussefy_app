import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PatientbarcodeCard extends StatelessWidget {
  const PatientbarcodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getWidth(divide: 1.75),
      width: context.getWidth(divide: 2.90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () async {},
                  icon: const Icon(
                    Icons.print_rounded,
                    color: red,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.zoom_out_map_rounded,
                    color: red,
                  )),
            ],
          ),
          height20,
          Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: blueTransit, width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
            ),
            height: context.getWidth(divide: 3.5),
            width: context.getWidth(divide: 3.5),
            child: QrImageView(
              data: '100',
              size: 50,
              padding: const EdgeInsets.all(10),
            ),
          )
        ],
      ),
    );
  }
}
