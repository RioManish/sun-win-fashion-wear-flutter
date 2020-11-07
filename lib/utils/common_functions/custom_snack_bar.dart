import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  customGetSnackBarWithActionButton(titlemsg, contentmsg, context,
      {onPressed}) {
    return Get.snackbar(titlemsg, contentmsg,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        isDismissible: true,
        duration: Duration(hours: 1),
        mainButton: FlatButton(
          child: Text(
            'ok',
          //   style: TextStyle(
          //       color: Colors.white, fontFamily: tr('currFontFamily')),
          ),
          onPressed: () =>
          {
            onPressed == null ? Get.back : onPressed,
          },
        ));
  }

  customGetSnackBarWithOutActionButton(titlemsg, contentmsg, context) {
    return Get.snackbar(
      titlemsg,
      contentmsg,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      isDismissible: true,
      duration: Duration(seconds: 3),
    );
  }
}