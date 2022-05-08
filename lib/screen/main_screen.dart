import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String username, password;

  const MainScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  List<Map> additionalMenu =
      List.generate(8, (index) => {'icons': Icons.add, 'title': 'Menu $index'})
          .toList();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xffFFF4E2),
            padding: const EdgeInsets.all(40),
            height: _size.height,
            width: double.infinity,
            child: Column(
              children: [
                mainHeader(),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  height: 182,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFD788),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 80,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: additionalMenu.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: const Border(
                                  top: BorderSide(
                                      width: 1, color: Color(0xff212121)),
                                  left: BorderSide(
                                      width: 1, color: Color(0xff212121)),
                                  right: BorderSide(
                                      width: 1, color: Color(0xff212121)),
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xff212121)),
                                )),
                            child: Card(
                              color: const Color(0xffFFD788),
                              elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    additionalMenu[index]['icons'],
                                    color: Color(0xff212121),
                                  ),
                                  Text(
                                    additionalMenu[index]['title'],
                                    style: const TextStyle(
                                        fontFamily: 'SourceSansPro',
                                        color: Color(0xff212121)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 32,),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN APP',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 32,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          fontFamily: 'JosefinSlab',
                          fontSize: 24
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Color(0xff212121)),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text('#lorem'),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Color(0xff212121)),
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text('#ipsum'),
                            )      
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/city.jpg'),
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: Text(
                              '#PHOTOGRAPHY',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w900
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(
                            'City Footage',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w900
                            ),
                          ),
                          subtitle: Text(
                            'This foto taken by Egy Dya Hermawan when he went to new york',
                            style: TextStyle(
                              fontFamily: 'JosefinSlab',
                              fontWeight: FontWeight.w900
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Color(0xffFFF4E2),
                size: 32,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xffFFF4E2),
                size: 32,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Color(0xffFFF4E2),
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello,',
              style: TextStyle(fontSize: 32, fontFamily: 'JosefinSlab'),
            ),
            Text(
              fixUsername(widget.username),
              style: const TextStyle(
                  fontSize: 48,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w900),
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
        ))
      ],
    );
  }

  String fixUsername(String username) {
    String toFix = '';
    for (int i = 0; i < username.length; i++) {
      if (i == 0) {
        toFix += username[i].toUpperCase();
      } else {
        toFix += username[i].toLowerCase();
      }
    }
    return toFix;
  }
}
