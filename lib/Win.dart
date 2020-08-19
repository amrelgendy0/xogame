import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Win extends StatelessWidget {
  Win(this.Name);

  String Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              '${Name.toUpperCase()} WON!',
              style: TextStyle(
                fontSize: 37,
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                wordSpacing: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 40),
          CupertinoButton(
            color: Colors.grey,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Play Again'),
          )
        ],
      ),
    );
  }
}
