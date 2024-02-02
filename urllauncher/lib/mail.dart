// *this will not work read it understand*****************************************
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   void _sendEmail() async {
//     // Replace 'recipient@example.com' with the recipient's email address
//     const String emailAddress = 'recipient@example.com';

//     // Replace 'Subject' with your desired email subject
//     const String subject = 'Subject';

//     // Replace 'Hello, Email!' with your desired email body
//     const String body = 'Hello, Email!';

//     // Construct the mailto URL
//     String url = 'mailto:$emailAddress?subject=${Uri.encodeQueryComponent(subject)}&body=${Uri.encodeQueryComponent(body)}';

//     try {
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         // Handle error - the URL cannot be launched
//         print('Could not launch $url');
//       }
//     } catch (e) {
//       // Handle exception
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Integration'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _sendEmail,
//           child: const Text('Send Email'),
//         ),
//       ),
//     );
//   }
// }



// **************** final
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

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

  void _sendEmail() async {
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
    // ignore: deprecated_member_use
    await launch('$mailtoLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Integration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendEmail,
          child: const Text('Send Email'),
        ),
      ),
    );
  }
}
// ***************** read and understand ******************************
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mailto/mailto.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   void _sendEmail() async {
//     // Replace 'to@example.com' with the recipient's email address
//     const String toEmail = 'to@example.com';

//     // Replace 'cc1@example.com' and 'cc2@example.com' with cc recipients if needed
//     const List<String> ccEmails = ['cc1@example.com', 'cc2@example.com'];

//     // Replace 'Subject' with your desired email subject
//     const String subject = 'Subject';

//     // Replace 'Hello, Email!' with your desired email body
//     const String body = 'Hello, Email!';

//     final mailtoLink = Mailto(
//       to: [toEmail],
//       cc: ccEmails,
//       subject: subject,
//       body: body,
//     );

//     // Convert the Mailto instance into a string and launch the URL
//     await launch('$mailtoLink');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Integration'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _sendEmail,
//           child: const Text('Send Email'),
//         ),
//       ),
//     );
//   }
// }
// *****************
