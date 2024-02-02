// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import 'package:urllauncher/home.dart';

void main() => runApp(const MyPage());

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

// ignore_for_file: deprecated_member_use, avoid_print

// ignore_for_file: avoid_print, deprecated_member_use, prefer_const_constructors

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Url Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
