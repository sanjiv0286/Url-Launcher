
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // void _openFacebook() async {
  //   // Replace 'fb://page/123456789' with the actual Facebook page ID or username
  //   const String facebookUrl = 'fb://page/123456789';

  //   // If the Facebook app is installed, open the app, otherwise open in the browser
  //   if (await canLaunch(facebookUrl)) {
  //     await launch(facebookUrl);
  //   } else {
  //     // Fallback to opening in the browser
  //     const String fallbackUrl = 'https://www.facebook.com/profile.php?id=100072588787099';
  //     await launch(fallbackUrl);
  //   }
  // }
  void _openFacebook() async {
    // Replace 'https://www.facebook.com/123456789' with the actual Facebook page URL
    const String facebookUrl =
        'https://www.facebook.com/profile.php?id=100072588787099';

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      // ignore: avoid_print
      print('Could not launch $facebookUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open URL in App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openFacebook,
          child: const Text('Open Facebook'),
        ),
      ),
    );
  }
}
