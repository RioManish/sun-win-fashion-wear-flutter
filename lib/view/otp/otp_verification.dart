import 'dart:convert';
import 'dart:ui' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sunwinfashionwear/theme/colors.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/ModalRoundedProgressBar.dart';
import 'package:sunwinfashionwear/utils/common_functions/custom_snack_bar.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/view/otp/bloc/otp_bloc.dart';
import 'package:sunwinfashionwear/view/otp/bloc/otp_event.dart';
import 'package:sunwinfashionwear/view/otp/bloc/otp_state.dart';
import 'package:sunwinfashionwear/view/otp/otp_footer.dart';
import 'package:sunwinfashionwear/view/otp/pin_code_textfield.dart';

class OtpVerification extends StatelessWidget {
  final String mobileNumber;
  final int userId;
  final String dialcode;
  final String email;

  OtpVerification({this.mobileNumber, this.userId, this.dialcode, this.email});

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return true
          // (await customAlertDialog(
          //         context,
          //         tr("txt_contact_us_error"),
          //         tr("yes"),
          //         tr("no"),
          //         tr("otp"),
          //         tr("confirm"),
          //         () => {
          //               Navigator.of(context).pop(),
          //             }))
          ??
          false;
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
          userId: userId,
          dialcode: dialcode,
          email: email),
      // ),
      // ),
    );
  }
}

class _OtpVerification extends StatefulWidget {
  final String mobileNumber;
  final int userId;
  final String dialcode;
  final String email;

  _OtpVerification({this.mobileNumber, this.userId, this.dialcode, this.email});

  @override
  _OtpVerificationPage createState() => _OtpVerificationPage(dialcode);
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

    // timerStarts();
  }

  // timerStarts() {
  //   CountDown cd = CountDown(Duration(seconds: Constants.RESEND_TIME));
  //   sub = cd.stream.listen(null);

  //   sub.onData((Duration d) {
  //     setState(() {
  //       _setTime = d.inSeconds < 10
  //           ? "00:0" + d.inSeconds.toString()
  //           : "00:" + d.inSeconds.toString();
  //       if (hasTimerStopped) hasTimerStopped = false;
  //     });
  //     sub.onDone(() {
  //       setState(() {
  //         hasTimerStopped = true;
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var progressBar = ModalRoundedProgressBar(
      handleCallback: (handler) {
        _handler = handler;
        return;
      },
    );

    return Stack(children: <Widget>[mainUI(context), progressBar]);

    // return BlocListener<OtpBloc, OtpState>(
    //   listener: (BuildContext context, state) {
    //     if (state is OnSuccess) {
    //       if (state.responseType == "otpValidateResponse") {
    //         // if (Constants.isChangePassword) {
    //         //   Navigator.push(
    //         //       context,
    //         //       new MaterialPageRoute(
    //         //           builder: (context) => ChangePassword(
    //         //               jsonDecode(state.response)["response"]["userId"])));
    //         // } else {
    //         //   Get.to(BaseInfoTwo(state.response));
    //         //   // UserInfo userInfo;

    //         //   // Get.to(RegistrationTermsAndCondition(userInfo));
    //         // }
    //       } else if (state.responseType == "otpResendResponse") {
    //         setState(() {
    //         //  timerStarts();
    //           hasTimerStopped = false;
    //           _otpController.text = "";
    //         });

    //         util.customGetSnackBarWithOutActionButton(
    //             success, (state.response), context);
    //       }
    //     } else if (state is OnFailure) {
    //       if (state.responseType == "otpValidateResponse") {
    //         util.customGetSnackBarWithOutActionButton(
    //             error, (state.error), context);
    //       }
    //     } else if (state is ShowProgressBar) {
    //       _handler.show();
    //       print("---> ShowProgressBar called");
    //     } else if (state is HideProgressBar) {
    //       print("---> HideProgressBar called");
    //       _handler.dismiss();
    //     } else if (state is LanguageSwitchedSuccess) {
    //       print('success===>language switched through bloc');
    //     } else if (state is LanguageSwitchedFailure) {
    //       util.customGetSnackBarWithOutActionButton(
    //           error, (state.error), context);
    //     }
    //   },
    //   child: BlocBuilder<OtpBloc, OtpState>(
    //     builder: (BuildContext context, state) {
    //       return Stack(children: <Widget>[mainUI(context), progressBar]);
    //     },
    //   ),
    // );
  }

  // dynamic onExit() {
  //   return customAlertDialog(
  //       context,
  //       "Do you want to discard ?",
  //       "Yes",
  //       "No",
  //       "OTP",
  //       "Confirm",
  //       () => {
  //             Navigator.of(context).pop(),
  //           });
  // }

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
                    // Navigator.pushNamed(context, '/otpscreen',
                    //     arguments: OtpVerification(
                    //         mobileNumber: "9087694",
                    //         userId: 9,
                    //         dialcode: "9087694",
                    //         email: "balfadjfdsfsdfemail.com"));
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
      maskCharacter: "maskText",
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
    return widget.dialcode;
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
    // BlocProvider.of<OtpBloc>(context).add(
    //   OtpVerificationPressed(
    //     userId: widget.userId,
    //     otp: _otpController.text,
    //   ),
    // );
  }

  resendOTP() {
    // BlocProvider.of<OtpBloc>(context).add(
    //   ResendOtpPressed(
    //       userId: widget.userId,
    //       otpTypeId: 1),
    // );
  }
}
