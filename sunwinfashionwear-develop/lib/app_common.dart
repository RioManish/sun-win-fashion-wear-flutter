import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/utils/route_generator.dart';

class App extends StatelessWidget {
  final FirebaseAnalyticsObserver analyticsObserver;
  App({this.analyticsObserver});
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  // FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    Crashlytics.instance.enableInDevMode = true;
    FlutterError.onError = Crashlytics.instance.recordFlutterError;

    return GetMaterialApp(
      navigatorKey: Get.key,
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[analyticsObserver],
      theme: ThemeData(
        primaryColor: themeColor,
        accentColor: Colors.cyan[600],
      ),

      // home: SPUtil.getString(Constants.GoogleSignInUUID) == null ||
      //     SPUtil.getString(Constants.GoogleSignInUUID) == ""
      //     ? "SignInPage()" : "Dashboard("

//      home: AuthService().handleAuth(),
      initialRoute: '/splash',

      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
