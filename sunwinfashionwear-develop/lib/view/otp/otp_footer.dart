
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class OTPVerificationFooter extends StatelessWidget {
  String btnTitle;
  String navigationPagetitle;

  OTPVerificationFooter(this.btnTitle, this.navigationPagetitle);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Text(btnTitle),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 6.4,
      ),
    );
  }
}
