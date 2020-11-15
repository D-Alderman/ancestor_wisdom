import 'package:flutter/material.dart';
import 'package:ancestor_wisdom/constants.dart';
import 'package:bordered_text/bordered_text.dart';
import 'dart:math';
import 'package:ancestor_wisdom/presentation/stress_icon.dart';

//this screen shows off the ancestor's quotes
class AncestorWisdom extends StatefulWidget {
  @override
  _AncestorWisdomState createState() => _AncestorWisdomState();
}

class _AncestorWisdomState extends State<AncestorWisdom> {

  //we will use _index to pull a quote from our list
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: BorderedText(
          strokeWidth: 6.0,
          strokeColor: Color(0xFF862e20),
          child: Text(
            'Ancestor\'s Wisdom',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/hamlet_background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              width: 350,
              height: 200,
              margin: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Color(0x88303030),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    kAncestorQuoteList[_index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey[700],
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _getQuote,
                color: Color(0xFF71271b),
                icon: Icon(
                  StressIcon.stress_png,
                  color: Colors.black,
                ),
                label: Text(
                  'I Beseech Thee',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getQuote() {
    setState(() {
      _index = Random().nextInt(kAncestorQuoteList.length - 1) + 1;
    });
  }
}
