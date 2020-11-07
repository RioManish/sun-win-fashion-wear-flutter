import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/view/dashboard/dashboard.dart';
import 'package:sunwinfashionwear/view/login/login_page.dart';
import 'package:sunwinfashionwear/view/otp/otp_verification.dart';
import 'package:sunwinfashionwear/view/splash/splash_page.dart';
import 'package:sunwinfashionwear/view/wishList/wishlist_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/otpscreen':
        return MaterialPageRoute(builder: (_) => OtpVerification());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/mywishlist':
        return MaterialPageRoute(builder: (_) => MyWishListPage());

      // case '/':
      //   return MaterialPageRoute(builder: (_) => SignInPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
