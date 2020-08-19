import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xogame/Win.dart';
import 'package:google_fonts/google_fonts.dart';
import 'XO_HELPER.dart';

class PlayBoard extends StatefulWidget {
  PlayBoard({this.xplayername, this.oplayername, this.Playwithcomputer});

  bool Playwithcomputer = false;
  final String xplayername;
  String oplayername;

  @override
  _PlayBoardState createState() => _PlayBoardState();
}

class _PlayBoardState extends State<PlayBoard> {
  Widget C(int text) {
    return InkWell(
      onTap: () {
        if (Game[text] == '') {
          setState(() {
            if (!widget.Playwithcomputer) {
              //Play with friend
              WillXplay
                  ? {Game[text] = 'X', Check('X')}
                  : {Game[text] = 'O', Check('O')};
              WillXplay = !WillXplay;
            } else {
              try {
                if (WillXplay) {
                  Game[text] = 'X';
                  Check('X');
                  List<int> freeIndexs = [];
                  for (int i = 0; i < Game.length; i++) {
                    if (Game[i] == '') {
                      freeIndexs.add(i);
                    }
                  }
                  Game[freeIndexs[Random().nextInt(freeIndexs.length)]] = 'O';
                  Check('O');
                }
              } catch (e) {
                print(e);
              }
            }
          });
        }
        if (isOwin || isXwin) {
          String Winnername = isXwin ? widget.xplayername : widget.oplayername;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Win(Winnername);
          }));
          Game.fillRange(0, Game.length, '');
          if (widget.Playwithcomputer && isOwin) {
            isOwin = false;
            Game[Random().nextInt(Game.length)] = 'O';
            WillXplay = true;
          } else if (isXwin) {
            isXwin = false;
            WillXplay = true;
          } else if (isOwin) {
            isOwin = false;
            WillXplay = false;
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        child: Center(
            child: Text(
          Game[text],
          style: GoogleFonts.indieFlower(
              fontSize: 80,
              color: Game[text] == 'X' ? Colors.red : Colors.green),
        )),
        width: 100,
        height: 100,
        color: Colors.grey.shade300,
      ),
    );
  }

  @override
  void initState() {
    if (widget.Playwithcomputer) {
      widget.oplayername = 'Computer';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X&O GAME'),
        backgroundColor: ThemeData.dark().primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            WillXplay
                ? '${widget.xplayername.toUpperCase()} TURN'
                : '${widget.oplayername.toUpperCase()} TURN',
            style: TextStyle(
              fontSize: 28,
              color: WillXplay ? Colors.red : Colors.green,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              wordSpacing: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              C(0),
              C(1),
              C(2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              C(3),
              C(4),
              C(5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              C(6),
              C(7),
              C(8),
            ],
          ),
          const SizedBox(height: 30),
          CupertinoButton(
            color: Colors.grey,
            child: const Text('Reset'),
            onPressed: () {
              setState(() {
                Game.fillRange(0, Game.length, '');
              });
            },
          )
        ],
      ),
    );
  }
}
