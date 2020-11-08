import 'dart:ui' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunwinfashionwear/theme/colors.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/ModalRoundedProgressBar.dart';
import 'package:sunwinfashionwear/utils/common_functions/custom_snack_bar.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/view/login/otp/pin_code_textfield.dart';


class OtpVerification extends StatelessWidget {
  final String mobileNumber;
  final int otp;

  OtpVerification({this.mobileNumber, this.otp});

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return true;
    }

    return new WillPopScope(
      onWillPop: _onWillPop,
      // child: Scaffold(
      // child: BlocProvider(
      //   create: (context) {
      //     return OtpBloc();
      //   },
      child: _OtpVerification(
          mobileNumber: mobileNumber,
          otp: otp,),
      // ),
      // ),
    );
  }
}

class _OtpVerification extends StatefulWidget {
  final String mobileNumber;
  final int otp;
  final String dialCode="+91";

  _OtpVerification({this.mobileNumber, this.otp});

  @override
  _OtpVerificationPage createState() => _OtpVerificationPage(dialCode);
}

class _OtpVerificationPage extends State<_OtpVerification> {
  final String dialcode;

  _OtpVerificationPage(this.dialcode);

  TextEditingController _otpController = TextEditingController(text: "");
  bool hasTimerStopped = false;

  Utils util = Utils();

  ProgressBarHandler _handler;

  String _setTime = '00:00';
  var sub;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var progressBar = ModalRoundedProgressBar(
      handleCallback: (handler) {
        _handler = handler;
        return;
      },
    );

    return Stack(children: <Widget>[mainUI(context), progressBar]);

  }

  Widget mainUI(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(otpVerification, style: otpVerificationStyle),
                    )),
              )
            ],
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        ),
        body: Column(
              children: <Widget>[
                // LoginPageImage("register"),
                Padding(
                  padding: const EdgeInsets.all(paddingTen),
                  child: Image.asset(otp_verification_img),
                ),
                pincodeBox(),
                resendPinAndTimer(),
                GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(context, '/dashboard');

                  },
                  child: Container(
                    height: 40.0,
                    width:
                        (MediaQuery.of(context).size.width / 1.0) - 10.0,
                    margin: EdgeInsets.fromLTRB(paddingTwenty, paddingTen,
                        paddingTwenty, paddingTen),
                    decoration: BoxDecoration(
                      color: loginButtonColor,
                      borderRadius: BorderRadius.circular((5.0)),
                    ),
                    child: Center(
                        child: Text(verifyLogin, style: getOTPButton)),
                  ),
                )
              ],
            )
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }

  Widget resendPinAndTimer() {
    return Container(
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
            visible: hasTimerStopped,
            child: GestureDetector(
                onTap: () {
                  print("resend pin");

                  if (hasTimerStopped) {
                    resendOTP();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("SDdasda"),
                  // child: PackageListHead.customTextView(
                  //     context,
                  //     hasTimerStopped ? 1.0 : 0.5,
                  //     resendOtp,
                  //     hasTimerStopped,
                  //     FontWeight.w500),
                )),
          ),
          Visibility(
              visible: !hasTimerStopped,
              child: Text("$_setTime",
                  style: TextStyle(
                    color: primaryTextColor,
                    // fontSize: Styles.packageExpandTextSiz,
                    fontFamily: poppinsRegular,
                  ))),
//              PackageListHead.customTextView(
//                  context, 1.0, "${_setTime}", false, FontWeight.bold)),
        ],
      ),
    );
  }

  Widget pincodeBox() {
    return PinCodeTextField(
      textDirection: Localizations.localeOf(context).languageCode == "en"
          ? prefix.TextDirection.ltr
          : prefix.TextDirection.rtl,
      autofocus: false,
      controller: _otpController,
//      pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 4.0),
      hideCharacter: true,
      highlight: true,
      defaultBorderColor: themeColor,
      maxLength: 6,
      pinBoxWidth: MediaQuery.of(context).size.width < 350.0
          ? (MediaQuery.of(context).size.width / 6) - 23.0
          : 40.0,
      pinBoxHeight: MediaQuery.of(context).size.width < 350.0
          ? ((MediaQuery.of(context).size.width / 6) - 23.0) + 10.0
          : 50.0,
      maskCharacter: "#",
      onDone: (text) {
        print("DONE $text");
        print("DONE CONTROLLER ${_otpController.text}");
      },
      wrapAlignment: WrapAlignment.spaceAround,
      pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
      pinTextStyle: TextStyle(
        color: primaryTextColor,
        fontSize: fourteenSize,
        fontFamily: poppinsRegular,
      ),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      pinTextAnimatedSwitcherDuration:
          Duration(milliseconds: Duration.millisecondsPerSecond),
      highlightAnimationBeginColor: primaryTextColor,
      highlightAnimationEndColor: whiteColor,
      keyboardType: TextInputType.number,
      mobileNumber: passingDescriptionToMobileNo(),
      countrycode: passingDescriptionToCountryCode(),
    );
  }

  String passingDescriptionToMobileNo() {
    return widget.mobileNumber;
  }

  String passingDescriptionToCountryCode() {
    return dialcode;
  }

  _validateOTP() {
    if (_otpController.text.isEmpty) {
      util.customGetSnackBarWithOutActionButton(error, otpError, context);
      return false;
    } else if (_otpController.text.length < 4) {
      util.customGetSnackBarWithOutActionButton(error, otpInvalid, context);
      return false;
    }
    return true;
  }

  continueBtnPres() {

  }

  resendOTP() {

  }
}
