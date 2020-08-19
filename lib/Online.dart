import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Online extends StatefulWidget {
  @override
  _OnlineState createState() => _OnlineState();
}
final _firestore = Firestore.instance;

class _OnlineState extends State<Online> {
  @override
  void add() async {
 await   _firestore.collection('amr').add({
      'dsfdsfds':'dsfsdfdsfds',
      'dsfsdassdfdsfsdfds':'dsfsdfsdfsd'
    });

  }

  void initState() {
    add();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('X&O GAME'),
          backgroundColor: ThemeData.dark().primaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ddsd'),
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
          ],
        ),
      ),
    );
  }
}

Widget C(int text) {
  return Container(
    margin: const EdgeInsets.all(3),
    child: Center(child: Text(' ')),
    width: 100,
    height: 100,
    color: Colors.grey.shade300,
  );
}
