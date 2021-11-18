// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations, deprecated_member_use

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageItemContent extends StatefulWidget {
  final String title;
  PageItemContent({required this.title});

  @override
  State<PageItemContent> createState() => _PageItemContentState();
}

class _PageItemContentState extends State<PageItemContent> {
  int timeLeft = 50;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alert Dialog'),
          content: Text(timeLeft.toString()),
          actions: <Widget>[
            FlatButton(
              child: Text('Start'),
              onPressed: _startCountDown,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: _startCountDown,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${widget.title}'),
                Text(timeLeft == 0 ? 'Time Out' : '$timeLeft',
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade500,
                spreadRadius: 1.0,
                blurRadius: 15.0,
                offset: Offset(4.0, 4.0), // changes position of shadow
              ),
              BoxShadow(
                color: Colors.deepPurple.shade200,
                spreadRadius: 1.0,
                blurRadius: 15.0,
                offset: Offset(-4.0, -4.0), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
