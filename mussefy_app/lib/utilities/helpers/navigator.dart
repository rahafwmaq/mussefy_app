
import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  // ---------------------------------------------------------------------------
  pushView({required Widget view, Function(dynamic)? then}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => view))
        .then((value) {
      if (then != null) {
        then(value);
      }
    });
  }

  //----------------------------------------------------------------------------
  popView() {
    Navigator.pop(this, 'back');
  }

  //----------------------------------------------------------------------------
  removeUntil({required Widget view}) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => view),
        ModalRoute.withName('/view'));
  }
}
