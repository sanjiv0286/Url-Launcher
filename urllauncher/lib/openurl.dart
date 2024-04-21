// ******************************Open in app******************************************
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse('http://starsanjiv.github.io/Sanjiv-Portfolio/');

// void main() => runApp(
//       const MaterialApp(
//         home: Material(
//           child: Center(
//             child: ElevatedButton(
//               onPressed: _launchUrl,
//               child: Text('Show Flutter homepage'),
//             ),
//           ),
//         ),
//       ),
//     );
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

// ignore_for_file: deprecated_member_use

// ****************** Open Url in browser by user input*************************
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _urlController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Opener App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter URL',
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _openURL();
              },
              child: const Text('Open URL'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open the URL
  void _openURL() async {
    String url = _urlController.text;

    if (url.isNotEmpty) {
      if (await canLaunch(url)) {
        setState(() {
          _errorMessage = ''; // Clear any previous error message
        });
        await launch(
          // forceWebView: true,
          url,
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid URL';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'URL cannot be empty';
      });
    }
  }
}
