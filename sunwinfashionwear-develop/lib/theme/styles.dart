library styles;

import 'package:flutter/material.dart';

//Poppins
const String poppinsBlack = "PoppinsBlack";
const String poppinsBlackItalic = "PoppinsBlackItalic";
const String poppinsBold = "PoppinsBold";
const String poppinsItalic = "PoppinsItalic";
const String poppinsLight = "PoppinsLight";
const String poppinsMedium = "PoppinsMedium";
const String poppinsRegular = "PoppinsRegular";

//FontSize
const double eightSize = 8.0;
const double tenSize = 10.0;
const double twelveSize = 12.0;
const double fourteenSize = 14.0;
const double sixteenSize = 16.0;
const double eighteenSize = 18.0;
const double twentySize = 20.0;

//PaddingSize
const double paddingTen = 10.0;
const double paddingFifteen = 15.0;
const double paddingTwenty = 20.0;

//Color
const Color themeColor = const Color.fromRGBO(229, 0, 126, 1);
const Color loginButtonColor = const Color.fromRGBO(229, 0, 126, 1);
const Color blackColor = const Color.fromRGBO(29, 29, 29, 1);
const Color whiteColor = const Color.fromRGBO(255, 255, 255, 1);
const Color phoneNumberTextColor = const Color.fromRGBO(85, 85, 85, 1);
const Color mobileNumberFieldTextColor = const Color.fromRGBO(153, 153, 153, 1);
const Color otpNumberTextColor = const Color.fromRGBO(0, 137, 217, 1);
const Color tabBarUnselectedColor = const Color.fromRGBO(102, 102, 102, 1);
const Color themeColorLight = const Color.fromRGBO(253, 232, 243, 1);
const Color darkBlackColor = const Color.fromRGBO(0, 0, 0, 1);
const Color greenColor = const Color.fromRGBO(112, 173, 4, 1);
const Color orangeColor = const Color.fromRGBO(226, 146, 41, 1);
const Color redColor = const Color.fromRGBO(253, 30, 30, 1);
const Color lightGreyColor = const Color.fromRGBO(213, 213, 213, 1);
//Styles
//LoginPage
const TextStyle loginHeading =
    TextStyle(fontFamily: poppinsBold, fontSize: twentySize, color: blackColor);

const TextStyle phoneNumberHeading = TextStyle(
    fontFamily: poppinsRegular,
    fontSize: fourteenSize,
    color: phoneNumberTextColor);

const TextStyle getOTPButton = TextStyle(
    fontFamily: poppinsMedium, fontSize: sixteenSize, color: whiteColor);

const TextStyle otpVerificationStyle = TextStyle(
    fontFamily: poppinsMedium, fontSize: eighteenSize, color: whiteColor);

const TextStyle otpVerificationText = TextStyle(
  color: blackColor,
  fontSize: eighteenSize,
  fontFamily: poppinsMedium,
);

const TextStyle sentYouSMSText = TextStyle(
  color: mobileNumberFieldTextColor,
  fontSize: fourteenSize,
  fontFamily: poppinsRegular,
);

const TextStyle otpNumberText = TextStyle(
  color: otpNumberTextColor,
  fontSize: sixteenSize,
  fontFamily: poppinsRegular,
);

const TextStyle appBarTitleTextStyle = TextStyle(
  color: whiteColor,
  fontSize: eighteenSize,
  fontFamily: poppinsMedium,
);

const TextStyle navigationBarTitle = TextStyle(
  color: themeColor,
  fontSize: twelveSize,
  fontFamily: poppinsMedium,
);

const TextStyle navigationBarTitleUnselected = TextStyle(
  color: blackColor,
  fontSize: twelveSize,
  fontFamily: poppinsMedium,
);

const TextStyle accountTitleStyle = TextStyle(
  color: darkBlackColor,
  fontSize: fourteenSize,
  fontFamily: poppinsMedium,
);

const TextStyle wishListTitleStyle = TextStyle(
  color: darkBlackColor,
  fontSize: eighteenSize,
  fontFamily: poppinsMedium,
  // fontWeight: FontWeight.w700
);

const TextStyle wishListCountStyle = TextStyle(
  color: themeColor,
  fontSize: fourteenSize,
  fontFamily: poppinsMedium,
  // fontWeight: FontWeight.w700
);

const TextStyle openButtonStyle = TextStyle(
  color: whiteColor,
  fontSize: fourteenSize,
  fontFamily: poppinsRegular,
);

const TextStyle trendingTitleStyle = TextStyle(
  color: blackColor,
  fontSize: sixteenSize,
  fontFamily: poppinsBold,
);

const TextStyle viewAllTextStyle = TextStyle(
  color: themeColor,
  fontSize: twelveSize,
  fontFamily: poppinsRegular,
);

const TextStyle wishItemTitle = TextStyle(
  color: darkBlackColor,
  fontSize: tenSize,
  fontFamily: poppinsRegular,
);

const TextStyle wishItemPriceStyle = TextStyle(
  color: orangeColor,
  fontSize: tenSize,
  fontFamily: poppinsMedium,
);

const TextStyle wishItemPriceOfferStyle = TextStyle(
  color: themeColor,
  fontSize: eightSize,
  fontFamily: poppinsMedium,
);

const TextStyle wishItemPriceOfferStrikedStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  color: mobileNumberFieldTextColor,
  fontSize: eightSize,
  fontFamily: poppinsRegular,
);

const TextStyle addToCartButtonStyle = TextStyle(
  color: whiteColor,
  fontSize: fourteenSize,
  fontFamily: poppinsMedium,
);

const TextStyle cartStyle = TextStyle(
  color: mobileNumberFieldTextColor,
  fontSize: twelveSize,
  fontFamily: poppinsRegular,
);

const TextStyle cartTitleStyle = TextStyle(
  color: darkBlackColor,
  fontSize: twelveSize,
  fontFamily: poppinsMedium,
);

const TextStyle inStockTextStyle = TextStyle(
  color: greenColor,
  fontSize: twelveSize,
  fontFamily: poppinsMedium,
);

const TextStyle outOfStockTextStyle = TextStyle(
  color: redColor,
  fontSize: twelveSize,
  fontFamily: poppinsMedium,
);
