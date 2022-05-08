import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_app/check_login.dart';
import 'package:login_app/screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameControl = TextEditingController();
  final _passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 88, bottom: 8),
          color: const Color(0xffFFF4E2),
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Hello,\nWelcome Back !',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 48,
                        color: Color(0xff212121),
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Please Sign In to continue',
                      style: TextStyle(fontFamily: 'JosefinSlab', fontSize: 24),
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildInputForm(_usernameControl, false, 'Username'),
                    const SizedBox(
                      height: 16,
                    ),
                    buildInputForm(_passwordControl, true, 'Password'),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro', fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: Container(
                              height: 54,
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                  color: const Color(0xffFEC574),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide.none))),
                        ),
                        Container(
                          height: 54,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Validated');
                                final doLogin = CheckLogin(
                                    username: _usernameControl.text,
                                    password: _passwordControl.text);
                                if (doLogin.checkLoginData()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen(
                                                username: _usernameControl.text,
                                                password: _passwordControl.text,
                                              )));
                                } else {
                                  final loginFailedReport = SnackBar(
                                    content: const Text(
                                      'Username or Password is incorrect!'
                                    ),
                                    action: SnackBarAction(
                                      label: 'Clear Form',
                                      onPressed: () {
                                        _usernameControl.clear();
                                        _passwordControl.clear();
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(loginFailedReport);
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(
                                    width: 1, color: Color(0xff212121))),
                            elevation: 0,
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 24,
                                  color: Color(0xff212121)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an account?',
                        style:
                            TextStyle(fontFamily: 'JosefinSlab', fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontFamily: 'JosefinSlab',
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildInputForm(TextEditingController controller, bool obscureText,
          String hintText) =>
      TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontFamily: 'SourceSansPro', fontSize: 18),
            errorStyle:
                const TextStyle(fontFamily: 'SourceSansPro', fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 1, color: Color(0xff212121)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 1, color: Color(0xff212121)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
          validator: hintText == 'Username'
              ? RequiredValidator(errorText: '- Username is required')
              : MultiValidator([
                  RequiredValidator(errorText: '- Password is required'),
                  MinLengthValidator(8,
                      errorText: '- Password must be least 8 digits long')
                ]));
}
