import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/utils/constants.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPage();
}

class _SplashPage extends State<Splash> with TickerProviderStateMixin {
  AnimationController _controller;
  bool _visible = false;

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 6000), vsync: this, value: 0.6);
    _controller.forward();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
    Future.delayed(Duration(milliseconds: 7000), () {
      Navigator.popAndPushNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSplashUI();
  }

  Widget showSplashUI() => AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(seconds: 5),
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background_img), fit: BoxFit.cover),
            ),
            child: Image.asset(
              sunwinlogo_img,
            )),
      );
}
