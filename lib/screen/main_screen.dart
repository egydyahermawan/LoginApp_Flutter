import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String username, password;
  
  const MainScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xffFFF4E2),
          padding: const EdgeInsets.all(40),
          height: _size.height,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'JosefinSlab'
                        ),
                      ),
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 48,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w900
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: const CircleAvatar(
                      backgroundColor: Color(0xffFEC574),
                      radius: 32,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 48,
                        color: Color(0xff212121),
                      ),
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        decoration: const BoxDecoration(
          color: Color(0xff212121),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: (){},
              icon: const Icon(Icons.home, color: Color(0xffFFF4E2), size: 32,),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: (){},
              icon: const Icon(Icons.search_rounded, color: Color(0xffFFF4E2), size: 32,),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: (){},
              icon: const Icon(Icons.settings, color: Color(0xffFFF4E2), size: 32,),
            ),
          ],
        ),
      ),
    );
  }
}
