// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var mobileNo = '+918005835887';
  void sendEmail() async {
    // Replace 'Subject' with your desired email subject
    const String subject = 'Subject';

    // Replace 'Hello, Email!' with your desired email body
    const String body = '';

    // Build the Mailto instance without specifying any email addresses
    final mailtoLink = Mailto(
      subject: subject,
      body: body,
    );

    // Convert the Mailto instance into a string and launch the URL
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('MyHomePage')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                shape: const StadiumBorder(),
                minWidth: double.infinity,
                color: Colors.green,
                onPressed: () {
                  launch(
                      'https://play.google.com/store/apps/details?id=com.whatsapp&hl=en&gl=US&pli=1');
                },
                child: const Text('WhatsApp'),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue,
                shape: const StadiumBorder(),
                onPressed: () {
                  launch(
                      'https://www.facebook.com/profile.php?id=100072588787099');
                },
                child: const Text('Facebook'),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: const StadiumBorder(),
                color: Colors.purple,
                onPressed: () {
                  launch('tel: $mobileNo');
                },
                child: const Text('Call'),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: const StadiumBorder(),
                color: Colors.pink,
                onPressed: () {
                  launch('sms: $mobileNo');
                },
                child: const Text('SMS'),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: const StadiumBorder(),
                color: Colors.pink,
                onPressed: () {
                  // launch('sms: $mobileNo');
                  sendEmail();
                },
                child: const Text('Mail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
