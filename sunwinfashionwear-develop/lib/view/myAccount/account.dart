import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/custom_list_tile.dart'
    as prefix0;
import 'package:sunwinfashionwear/view/login/login_page.dart';

class MyAccountPage extends StatelessWidget {
  MyAccountPage();

  @override
  Widget build(BuildContext context) {
    return _MyAccountPage();
  }
}

class _MyAccountPage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  _MyAccountPage();

  @override
  State<StatefulWidget> createState() => __MyAccountPageState(
      // analytics, observer
      );
}

class __MyAccountPageState extends State<_MyAccountPage> {
  __MyAccountPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: themeColorLight,
                  borderRadius: BorderRadius.circular(8.0)),
              child: WishList()),
          Container(
            child: CustomRow(viewMyOrder, order_img),
          ),
          Divider(),
          Container(
            child: CustomRow(termsAndConditions, terms_img),
          ),
          Divider(),
          Container(
            child: CustomRow(privacyPolicy, policy_img),
          ),
          Divider(),
          Container(
            child: CustomRow(reportProblem, policy_img),
          ),
          Divider(),
          Container(
            child: CustomRow(settings, settings_img),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Container(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                children: [
                  Image.asset(logout_img),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                    child: Text(
                      logout,
                      style: accountTitleStyle,
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget WishList() {
    return Row(
      children: [
        Image.asset(like_img, color: themeColor),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myWishList,
                style: wishListTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  itemsCount,
                  style: wishListCountStyle,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/mywishlist');
          },
          child: Container(
            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
                color: greenColor, borderRadius: BorderRadius.circular(5.0)),
            child: Text(
              openButton,
              style: openButtonStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget CustomRow(title, icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Row(
        children: [
          Image.asset(icon),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5.0),
            child: Text(title, style: accountTitleStyle),
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: themeColor)
        ],
      ),
    );
  }
}
