import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/mobile_number_textfield.dart';
import 'package:sunwinfashionwear/theme/colors.dart';
import 'package:sunwinfashionwear/theme/fonts.dart';
import 'package:sunwinfashionwear/theme/styles.dart';

import 'package:sunwinfashionwear/utils/ModalRoundedProgressBar.dart';
import 'package:sunwinfashionwear/utils/common_functions/custom_snack_bar.dart';
import 'package:sunwinfashionwear/utils/constants.dart';

import 'bloc/get_otp_bloc.dart';
import 'otp/otp_verification.dart';


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
  TextEditingController mobileNumberController = TextEditingController();
  GetOtpBloc loginBloc;
  @override
  void initState() {
    mobileNumberController = TextEditingController();
    loginBloc=GetOtpBloc();
    super.initState();
  }

  @override
  void dispose() {
    mobileNumberController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider<GetOtpBloc>(
      create: (context) => loginBloc,
      child: BlocConsumer<GetOtpBloc, GetOtpSate>(
        builder: (context, state) {
          return mainUI(context,state);
        },
        listener: (context, state) {
          if(state is GetOtpSuccess)
            {
              Navigator.pushNamed(context, '/otpscreen',
                  arguments: OtpVerification(mobileNumber: state.responseData.mobileNumber, otp: state.responseData.otp,));

            }
          else if(state is GetOtpFailed){
              Fluttertoast.showToast(msg: state.error);
          }
        },
      ),
    );

  }

  Widget mainUI(BuildContext context,dynamic state) {
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
                                mobileNumberController,
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
                        loginBloc.add(GetOTPButtonPressedEvent(mobileNumber:mobileNumberController.text.toString() ,countryId: 0,applicationId: 0));
                      },
                      child:(state is InitialGetOtpLoadingState)? Center(child: CircularProgressIndicator(),): Container(
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
