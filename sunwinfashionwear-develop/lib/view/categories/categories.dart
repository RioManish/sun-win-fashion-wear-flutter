import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage();

  @override
  Widget build(BuildContext context) {
    return _CategoriesPage();
  }
}

class _CategoriesPage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  _CategoriesPage();

  @override
  State<StatefulWidget> createState() => __CategoriesPageState(
      // analytics, observer
      );
}

class __CategoriesPageState extends State<_CategoriesPage> {
  __CategoriesPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Text("In Progress")),
    );
  }
}
