import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _height = 50;
  double _width = 50;
  double _height1 = 10;
  double _width1 = 10;
  double _height2 = 30;
  double _width2 = 30;

  @override
  void initState() {
    super.initState();
    trigerOne();
      _height = 20;
    _width = 20;
    trigerTwo();
    triggerThree();
  }
  trigerOne() async {
    for (var i = 0; i < 100000; i++) {
    
      await Future.delayed(const Duration(seconds: 1));

      if (_height == 20) {
        setState(() {
          _height = 120;
          _width = 120;
        });
      } else if (_height == 120) {
        setState(() {
          _height = 20;
          _width = 20;
        });
      }
      
    }
  }

  trigerTwo() async {
    for (var i = 0; i < 100000; i++) {
      await Future.delayed(const Duration(milliseconds: 980));
      if (_height1 == 10) {
        setState(() {
          _height1 = 117;
          _width1 = 117;
        });
      } else if (_height1 == 117) {
        setState(() {
          _height1 = 10;
          _width1 = 10;
        });
      }
    }
  }

  triggerThree() async {
    for (var i = 0; i < 100000; i++) {
      await Future.delayed(const Duration(milliseconds: 990));
      if (_height2 == 30) {
        setState(() {
          _height2 = 114;
          _width2 = 114;
        });
      } else if (_height2 == 114) {
        setState(() {
          _height2 = 30;
          _width2 = 30;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 980),
                      curve: Curves.easeIn,
                      height: _height1,
                      width: _width1,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 990),
                      curve: Curves.easeIn,
                      height: _height2,
                      width: _width2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 3),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
            ), 
               const SizedBox(
              height: 20,
            ),
          const  Text(
              "Loading...",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
