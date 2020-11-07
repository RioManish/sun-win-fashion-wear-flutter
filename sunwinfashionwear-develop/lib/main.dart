// import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/utils/analytics.dart';
import 'package:sunwinfashionwear/utils/route_generator.dart';
import 'package:sunwinfashionwear/utils/storage/SPUtils.dart';
import './utils/constants.dart' as Constants;
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_common.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  final SunwinAnalytics sunwinAnalytics;

  final FirebaseAnalytics analytics;

  SimpleBlocObserver({this.analytics, this.sunwinAnalytics});

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
    sunwinAnalytics.sendAnalyticsEvent(analytics, event.toString());
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
    // Crashlytics.instance.crash();
    // sunwinAnalytics.sendAnalyticsEvent(analytics, stackTrace.toString() + error.toString());
  }
}

Future<void> main() async {
  print("=====> main() called");
  WidgetsFlutterBinding.ensureInitialized();
  final SunwinAnalytics sunwinAnalytics = SunwinAnalytics();
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final FirebaseAnalyticsObserver analyticsObserver =
      FirebaseAnalyticsObserver(analytics: analytics);
  sunwinAnalytics.setAppOpened(analytics);
  Bloc.observer = SimpleBlocObserver(
      analytics: analytics, sunwinAnalytics: sunwinAnalytics);
  // Bloc.observer = SimpleBlocObserver();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  // Crashlytics.instance.crash();
  //
  // Crashlytics.instance.getVersion();
  // Crashlytics.instance.setString("hi", "hello world");
  await SPUtil.getInstance();
  runZoned<Future<void>>(() async {},
      onError: Crashlytics.instance.recordError);

  runApp(App(analyticsObserver: analyticsObserver));
}
