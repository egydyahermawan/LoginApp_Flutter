import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/screen/main_screen.dart';
import 'package:login_app/screen/register_screen.dart';
import 'package:login_app/screen/splash_screen.dart';

void main() {
  runApp(const LoginApp());
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black));
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Login App', home: Splash());
  }
}
