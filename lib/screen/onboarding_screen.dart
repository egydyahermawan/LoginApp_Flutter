import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreen createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  final _boardControl = PageController(initialPage: 0, keepPage: true);

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffFFF4E2),
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    child: isLastPage
                        ? const Text('')
                        : MaterialButton(
                            onPressed: () {
                              _boardControl.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xff212121)),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 24,
                              ),
                            ),
                          ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: PageView(
                  controller: _boardControl,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },
                  children: [
                    createBoarding('Board Title', 'Lorem Ipsum Dolor Sit Amet'),
                    createBoarding('Board Title', 'Lorem Ipsum Dolor Sit Amet'),
                    createBoarding('Board Title', 'Lorem Ipsum Dolor Sit Amet')
                  ],
                ),
              ),
              Center(
                  child: SmoothPageIndicator(
                controller: _boardControl,
                count: 3,
                effect: const SlideEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Color(0xff212121)),
                onDotClicked: (index) => _boardControl.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
              )),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Container(
                        height: 48,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                            color: const Color(0xffFEC574),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide.none))),
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        if (isLastPage == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }else{
                          _boardControl.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                              width: 1, color: Color(0xff212121))),
                      elevation: 0,
                      child: Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 24,
                            color: Color(0xff212121)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

createBoarding(title, description) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title.toString(),
          style: const TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 32,
              color: Color(0xff212121)),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          description,
          style: const TextStyle(
              fontFamily: 'JosefinSlab',
              fontSize: 24,
              color: Color(0xff212121)),
        ),
      )
    ],
  );
}
