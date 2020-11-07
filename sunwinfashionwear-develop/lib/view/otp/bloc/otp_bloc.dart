// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sunwinfashionwear/model/otp_validation.dart';

// import './bloc.dart';

// class OtpBloc extends Bloc<OtpEvent, OtpState> {
//   @override
//   OtpState get initialState => InitialOtpState();

//   @override
//   Stream<OtpState> mapEventToState(
//     OtpEvent event,
//   ) async* {
//     if (event is OtpVerificationPressed) {
//       try {
//         yield ShowProgressBar();

//         OtpValidation req = OtpValidation();

//         req.userId = event.userId;
//         req.otp = event.otp;

//         // LoginMeta m1 = await RegisterRepository().validateOTP(req);

//         // print('m1---> ${m1.statusMsg}');

//         // if (m1.statusCode == 200) {
//         //   yield OnSuccess(
//         //       response: (m1.statusMsg), responseType: "otpValidateResponse");
//         // } else {
//         //   yield OnFailure(
//         //       error: m1.statusMsg, responseType: "otpValidateResponse");
//         // }

//         yield HideProgressBar();
//       } catch (err) {
//         yield HideProgressBar();
//         yield OnFailure(error: err, responseType: "otpValidateResponse");
//       }
//     } else if (event is ResendOtpPressed) {
//       try {
//         yield ShowProgressBar();

//         // ResendOTPRequest req = ResendOTPRequest();

//         // req.userId = event.userId;
//         // req.otpTypeId = event.otpTypeId;

//         // LoginMeta m1 = await RegisterRepository().resendOTP(req);

//         // print('m1---> ${m1.statusMsg}');

//         // if (m1.statusCode == 200) {
//         //   yield OnSuccess(
//         //       response: jsonDecode(m1.statusMsg)["successMessage"],
//         //       responseType: "otpResendResponse");
//         // } else {
//         //   yield OnFailure(
//         //       error: m1.statusMsg, responseType: "otpResendResponse");
//         // }
      

//         yield HideProgressBar();
//       } catch (err) {
//         yield HideProgressBar();

//         yield OnFailure(error: err, responseType: "otpResendResponse");
//       }
//     } else if (event is OnLanguagechangeInReg) {
//       yield ShowProgressBar();
//       try {
//         print('calling LanguageSwitched');
//         await getCountryCodeDetails();
//         yield HideProgressBar();
//         yield LanguageSwitchedSuccess();
//       } catch (error) {
//         yield HideProgressBar();
//         yield LanguageSwitchedFailure(error: error);
//       }
//     } else if (event is ErrorDialogEvent) {
//       yield ErrorDialogState(title: event.title, content: event.content);
//     }
//   }

//   // Future getCountryCodeDetails(context) async {
//   //   List<Meta> m = List<Meta>();
//   //   var db = new DatabaseHelper();
//   //   var countryDetails = await db.getContentByCID(TableDetails.CID_COUNTRY);

//   //   if (countryDetails.arabicContent == null ||
//   //       countryDetails.englishContent == null) {
//   //     m = await Future.wait([SplashRepository().getCountryList()]);
//   //     if (m[0].statusCode == 200) {
//   //       await db.saveOrUpdateContent(
//   //           TableDetails.CID_COUNTRY, jsonEncode(m[0]));
//   //     }
//   //   }
//   // }

//   Future getCountryCodeDetails() async {
//     // List<Meta> m = List<Meta>();
//     // var db = new DatabaseHelper();
//     // var countryDetails = await db.getContentByCID(TableDetails.CID_COUNTRY);

//     // if (SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
//     //     Constants.LANGUAGE_ARABIC) {
//     //   if (countryDetails.arabicContent == null) {
//     //     m = await Future.wait([SplashRepository().getCountryList()]);
//     //     if (m[0].statusCode == 200) {
//     //       await db.saveOrUpdateContent(
//     //           TableDetails.CID_COUNTRY, jsonEncode(m[0]));
//     //     }
//     //   }
//     // } else {
//     //   if (countryDetails.englishContent == null) {
//     //     // m = await Future.wait([SplashRepository().getCountryList()]);
//     //     // if (m[0].statusCode == 200) {
//     //     //   await db.saveOrUpdateContent(
//     //     //       TableDetails.CID_COUNTRY, jsonEncode(m[0]));
//     //     // }
//     //   }
//     // }
//   }
// }
