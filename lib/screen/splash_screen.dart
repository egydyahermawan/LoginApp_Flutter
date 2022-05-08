import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_app/screen/onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4450),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xffFFF4E2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2 - 100,
                      left: 40, right: 40
                    ),
                    child: Column(
                      children: const <Widget>[
                        Text(
                          'Here Splash',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w900,
                              fontSize: 48,
                              color: Color(0xffF2A353),
                              decoration: TextDecoration.none),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Ini adalah aplikasi login untuk mu!',
                            style: TextStyle(
                                fontFamily: 'JosefinSlab',
                                fontSize: 24,
                                color: Color(0xff212121),
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w100),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      alignment: Alignment.bottomCenter,
                      width: 150,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Loading...',
                              style: TextStyle(
                                  fontFamily: 'JosefinSlab',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: Color(0xff212121)),
                            ),
                          ),
                          Container(
                            height: 15,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Color(0xff212121)),
                                borderRadius: BorderRadius.circular(50),
                              )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: LinearProgressIndicator(
                                value: controller.value,
                                color: const Color(0xff212121),
                                backgroundColor: const Color(0xffF5CB77),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ))),
    );
  }
}
