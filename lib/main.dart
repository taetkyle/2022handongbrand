import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(KyungPang());
}

class KyungPang extends StatefulWidget {
  KyungPang({super.key});

  @override
  State<KyungPang> createState() => _KyungPangState();
}

class _KyungPangState extends State<KyungPang> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MyAppExtension());
  }
}

class MyAppExtension extends StatefulWidget {
  const MyAppExtension({super.key});

  @override
  State<MyAppExtension> createState() => _MyAppExtensionState();
}

class _MyAppExtensionState extends State<MyAppExtension> {
  String buttonName1 = 'click';
  String buttonName2 = 'nextpage';
  int currentIndex = 0;
  var a = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cupang'),
      ),
      body: Center(
        child: Container(
          color: a,
          height: double.infinity,
          child: currentIndex == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      child: Text(buttonName1),
                      style: ElevatedButton.styleFrom(backgroundColor: a),
                      onPressed: () {
                        setState(() {
                          //3초간 유지 될수 있도록
                          buttonName1 = 'clicked';
                          a = Colors.grey;
                          buttonName2 = 'information';
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Text(buttonName2),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => secondpage(),
                          ),
                        );
                        setState(
                          () {
                            //3초간 유지 될수 있도록
                            buttonName2 = 'clicked';
                            a = Colors.green;
                            buttonName1 = 'click'; //버튼 눌렀을때 사진 나올수 있게 만들고 싶음
                          },
                        );
                      },
                    )
                  ],
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/soccerball.jpg',
                        height: 200,
                        width: 200,
                      ),
                      ElevatedButton(
                        child: Text('RETURN'),
                        onPressed: () {
                          setState(
                            () {
                              currentIndex = 0;
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'setting',
            icon: Icon(Icons.settings),
          )
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
