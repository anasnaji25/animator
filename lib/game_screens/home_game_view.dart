import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomegameView extends StatefulWidget {
  const HomegameView({super.key});

  @override
  State<HomegameView> createState() => _HomegameViewState();
}

class _HomegameViewState extends State<HomegameView> {
  double playerX = 0.0;
  double playerY = 1.0;

  double ballX = 0.5;
  double ballY = 0.0;

  int score = 0;

  Random rnd = Random();

  int fImage = 0;

  List images = [
    "apple2.png",
    "cherry5.png",
    "grape1.png",
    "grape4.png",
    "water_lemon3.png"
  ];

  moveRight() {
    setState(() {
      playerX += 0.1;
    });
    getOffSet();
  }

  moveUP() {
    setState(() {
      playerY = playerY - 0.1;
    });
    getOffSet();
  }

  moveDown() {
    setState(() {
      playerY += 0.1;
    });
    getOffSet();
  }

  moveLeft() {
    setState(() {
      playerX -= 0.1;
    });
    getOffSet();
  }

  getOffSet() {
    var playersoffset = Offset(playerX, playerY);
    var balloffset = Offset(ballX, ballY);

    print("player is $playerX , ${playerY.toStringAsFixed(1)}");
    print("ball is $ballX , $ballY");

    if (playerX.toStringAsFixed(1) == ballX.toStringAsFixed(1) &&
        playerY.toStringAsFixed(1) == ballY.toStringAsFixed(1)) {
      print("ball eaten");
      changeBall();
    }
  }

  changeBall() {
    int x = rnd.nextInt(10 - 0);
    int y = rnd.nextInt(10 - 0);
    int z = rnd.nextInt(5);
 

 
    setState(() {
      ballX = x / 10;
      ballY = y / 10;
      score += 1;
      fImage = z;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (value) {
          if (value.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            moveLeft();
          } else if (value.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            moveRight();
          } else if (value.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            moveUP();
          } else if (value.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            moveDown();
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/game_background.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            "Total Score : $score",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/game_background.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Stack(children: [
                    Container(
                      alignment: Alignment(playerX, playerY),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/charecter.png")),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Container(
                      alignment: Alignment(ballX, ballY),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/${images[fImage]}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
