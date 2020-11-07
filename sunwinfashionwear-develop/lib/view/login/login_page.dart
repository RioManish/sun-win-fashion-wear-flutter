import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/mobile_number_textfield.dart';
import 'package:sunwinfashionwear/theme/colors.dart';
import 'package:sunwinfashionwear/theme/fonts.dart';
import 'package:sunwinfashionwear/theme/styles.dart';

import 'package:sunwinfashionwear/utils/ModalRoundedProgressBar.dart';
import 'package:sunwinfashionwear/utils/common_functions/custom_snack_bar.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/view/otp/otp_verification.dart';

import 'bloc/bloc.dart';

class LoginPage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  LoginPage(// this.analytics, this.observer
      );

  @override
  State<LoginPage> createState() => _LoginFormState(
      // analytics, observer
      );
}

class _LoginFormState extends State<LoginPage> {
  Utils util = Utils();
  ProgressBarHandler _handler;
  TextEditingController _mobilenoController = TextEditingController();

  _LoginFormState(// this.analytics, this.observer
      );

  @override
  Widget build(BuildContext context) {
    // var data = EasyLocalizationProvider.of(context).data;

    var progressBar = ModalRoundedProgressBar(
      //getting the handler
      handleCallback: (handler) {
        _handler = handler;
        return;
      },
    );

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
    }

    return mainUI(context);

//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is OnSuccess) {
//           print("Success");
//           // Navigator.pushReplacement(
//           //     context,
//           //     new MaterialPageRoute(
//           //         builder: (context) => Dashboard(
//           //               selectedIndex: 0,
//           //             )));
//         } else if (state is OnFailure) {
//           util.customGetSnackBarWithOutActionButton(
//               "Error",
//               (state.error),
//               context); // snakBarMsg(state.error, ColorData.colorRed, context);
//         } else if (state is ShowProgressBar) {
//           _handler.show();
//         } else if (state is HideProgressBar) {
//           _handler.dismiss();
//         }
//       },
//       child: BlocBuilder<LoginBloc, LoginState>(
//         // ignore: missing_return
//         builder: (context, state) {
//           return
//           Stack(children: <Widget>[mainUI(context), progressBar]);
// //          return mainUI(state);
//           // if (state is InitialLoginState) {
//           //   mainUI();
//           // }
//         },
//       ),
//     );
  }

  Widget mainUI(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background_img), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: Image.asset(
                    sunwinlogo_img,
                    fit: BoxFit.cover,
                  )),
              // Spacer(),
              Container(
                height: height / 2.7,
                width: width / 1.0,
                margin: EdgeInsets.fromLTRB(
                    paddingTwenty, paddingTen, paddingTwenty, 0.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: paddingFifteen),
                      child: Text(login, style: loginHeading),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: paddingTwenty, top: paddingTwenty),
                            child: Text(
                              phoneNumber,
                              style: phoneNumberHeading,
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(paddingTwenty,
                                paddingTen, paddingTwenty, paddingTen),
                            child: LoginPageFields(
                                _mobilenoController,
                                "Mobile Number",
                                "+91",
                                Icons.edit,
                                TextInputType.phone,
                                TextInputAction.done,
                                (_selectedCountry) => {
                                      setState(() {
                                        print(_selectedCountry.toString());
                                      }),
                                    },
                                () => {}))
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.pushNamed(context, '/otpscreen',
                          arguments: OtpVerification(mobileNumber: "9087694", userId: 9, dialcode: "9087694", email: "balfadjfdsfsdfemail.com"));
                      },
                      child: Container(
                        height: 40.0,
                        width: (width / 1.0) - 10.0,
                        margin: EdgeInsets.fromLTRB(paddingTwenty, paddingTen,
                            paddingTwenty, paddingTen),
                        decoration: BoxDecoration(
                          color: loginButtonColor,
                          borderRadius: BorderRadius.circular((5.0)),
                        ),
                        child: Center(child: Text(getOTP, style: getOTPButton)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget SunwinLogo(BuildContext context) {}
