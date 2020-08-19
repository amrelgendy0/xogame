import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xogame/Online.dart';
import 'package:xogame/XO_HELPER.dart';
import 'PlayBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'X&O GAME',
            style: TextStyle(fontFamily: 'Raleway'),
          ),
          backgroundColor: ThemeData.dark().primaryColor,
        ),
        body: Online(),
      ),
    );
  }
}

class Names extends StatefulWidget {
  @override
  _NamesState createState() => _NamesState();
}

class _NamesState extends State<Names> {
  TextEditingController _X = TextEditingController();

  TextEditingController _O = TextEditingController();

  InputDecoration _decoration = InputDecoration(
    hintText: 'Enter O player name',
    hintStyle: TextStyle(color: Colors.black),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  );

  bool _computer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _X,
          decoration: _decoration.copyWith(hintText: 'Enter X player name'),
        ),
        const SizedBox(
          height: 10,
        ),
        !_computer
            ? TextField(
                controller: _O,
                decoration: _decoration,
              )
            : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
        SwitchListTile.adaptive(
          value: _computer,
          onChanged: (value) {
            setState(() {
              _computer = value;
            });
          },
          title: Text('Play With Computer?'),
        ),
        CupertinoButton(
          color: Colors.grey,
          child: const Text('Play'),
          onPressed: () {
            Game.fillRange(0, Game.length, '');
            WillXplay = true;
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return PlayBoard(
                Playwithcomputer: _computer,
                oplayername: _O.text.isEmpty ? 'O' : _O.text,
                xplayername: _X.text.isEmpty ? 'X' : _X.text,
              );
            }));
          },
        )
      ],
    );
  }
}
