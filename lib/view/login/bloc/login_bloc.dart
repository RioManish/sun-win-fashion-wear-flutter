// import 'dart:async';
// import 'dart:convert';

// import 'package:bloc/bloc.dart';

// import 'package:sunwinfashionwear/database/database_helper.dart';
// import 'package:sunwinfashionwear/database/table_data.dart';
// import 'package:sunwinfashionwear/model/Meta.dart';

// import './bloc.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   @override
//   LoginState get initialState => InitialLoginState();

//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is LoginButtonPressed) {
//       yield ShowProgressBar();

//       try {
//         // UserLogin request = UserLogin(
//         //     applicationId: event.applicationId,
//         //     countryId: event.countryId,
//         //     fcmToken: SPUtil.getString(Constants.FCM_TOKEN),
//         //     password: event.password,
//         //     userName: event.username);
//         // LoginMeta meta = await LoginRepository().authorizeLogin(request);

//       //   if (meta.statusCode == 200) {

//       //  //   SPUtil.putString(Constants.USER_EMAIL, loginResponse.email);
    
//       //     yield HideProgressBar();
//       //     yield OnSuccess();
//       //   } else {
//       //     yield HideProgressBar();
//       //     yield OnFailure(error: meta.statusMsg);
//       //   }

//         yield HideProgressBar();
//            yield OnSuccess();
//       } catch (error) {
//         yield HideProgressBar();
//         yield OnFailure(error: error.toString());
//       }
//     } else if (event is OnLanguagechange) {
//       yield ShowProgressBar();
//       try {
//         print('calling LanguageSwitched');

//         await getCountryCodeDetails();

//         yield HideProgressBar();
//         yield LanguageSwitched();
//       } catch (error) {
//         yield HideProgressBar();
//       }
//     }
//   }

//   Future getCountryCodeDetails() async {
//     List<Meta> m = List<Meta>();
//     var db = new DatabaseHelper();
//     var countryDetails = await db.getContentByCID(TableDetails.CID_COUNTRY);
//       if (countryDetails.englishContent == null) {
//        // m = await Future.wait([SplashRepository().getCountryList()]);
//         if (m[0].statusCode == 200) {
//           await db.saveOrUpdateContent(
//               TableDetails.CID_COUNTRY, jsonEncode(m[0]));
//         }
//       }
   
//   }
// }
