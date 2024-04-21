// *************  Flutter Open WhatsApp & Send Text Message without Flutter Plugin ********************
// // ignore_for_file: deprecated_member_use, duplicate_ignore

// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// // void main() {
// //   runApp(const MyApp());
// // }
// void main() async {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const MyApp(),
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

//   void _openWhatsApp() async {
//     await openWhatsApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WhatsApp Integration'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _openWhatsApp,
//           child: const Text('Open WhatsApp'),
//         ),
//       ),
//     );
//   }
// }

// openWhatsApp() async {
//   // Replace '1234567890' with the recipient's phone number
//   const String phoneNumber = '+91 7240250634';

//   // Replace 'Hello, WhatsApp!' with your desired message
//   const String message = 'Hello, I am Here!👋👋👋👀';

//   // Construct the URL
//   String url = "https://wa.me/$phoneNumber/?text=${Uri.encodeQueryComponent(message)}";

//   // ignore: duplicate_ignore
//   try {
//     // Use the canLaunch function to check if the URL can be launched
//     // ignore: deprecated_member_use
//     if (await canLaunch(url)) {
//       // Launch the URL using the launch function
//       await launch(url);
//     } else {
//       // Handle error - the URL cannot be launched
//       // ignore: avoid_print
//       print('Could not launch $url');
//     }
//   } catch (e) {
//     // Handle exception
//     // ignore: avoid_print
//     print('Error: $e');
//   }
// }

// **************************************************************************
// *by user input   Flutter Open WhatsApp & Send Text Message without Flutter Plugin****

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:country_code_picker/country_code_picker.dart';

void main() async {
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  CountryCode? selectedCountryCode;

  // void _openWhatsApp() async {
  //   // Get user input from text fields
  //   String phoneNumber = phoneNumberController.text;
  //   String message = messageController.text;

  //   // Construct the full phone number with country code
  //   String fullPhoneNumber = "${selectedCountryCode?.dialCode}$phoneNumber";

  //   // Construct the URL
  //   String url = "https://wa.me/$fullPhoneNumber/?text=${Uri.encodeQueryComponent(message)}";

  //   try {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       // Handle error - the URL cannot be launched
  //       print('Could not launch $url');
  //     }
  //   } catch (e) {
  //     // Handle exception
  //     print('Error: $e');
  //   }
  // }
  // void _openWhatsApp() async {
  //   // Get user input from text fields
  //   String phoneNumber = phoneNumberController.text;
  //   String message = messageController.text;

  //   // Validate input
  //   if (selectedCountryCode == null || phoneNumber.isEmpty) {
  //     print(
  //         'Invalid input. Please select a country code and enter a phone number.');
  //     return;
  //   }

  //   // Construct the full phone number with country code
  //   String fullPhoneNumber = "${selectedCountryCode?.dialCode}$phoneNumber";

  //   // Construct the URL
  //   String url =
  //       "https://wa.me/$fullPhoneNumber/?text=${Uri.encodeQueryComponent(message)}";

  //   try {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       // Handle error - the URL cannot be launched
  //       print('Could not launch $url');
  //     }
  //   } catch (e) {
  //     // Handle exception
  //     print('Error: $e');
  //   }
  // }

  void _openWhatsApp() async {
    // Get user input from text fields
    String phoneNumber = phoneNumberController.text;
    String message = messageController.text;

    // Validate input
    if (selectedCountryCode == null) {
      _showError('Please select a country code.');
      return;
    }

    if (phoneNumber.isEmpty) {
      _showError('Please enter a phone number.');
      return;
    }

    // Validate phone number format (you can adjust this validation based on your requirements)
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      _showError(
          'Invalid phone number format. Please enter only numeric digits.');
      return;
    }

    // Construct the full phone number with country code
    String fullPhoneNumber = "${selectedCountryCode?.dialCode}$phoneNumber";

    // Construct the URL
    String url =
        "https://wa.me/$fullPhoneNumber/?text=${Uri.encodeQueryComponent(message)}";

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Handle error - the URL cannot be launched
        _showError(
            'Could not launch WhatsApp. Please check the link and try again.');
      }
    } catch (e) {
      // Handle exception
      _showError('Error: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Integration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CountryCodePicker(
                    onChanged: (code) {
                      setState(() {
                        selectedCountryCode = code;
                      });
                    },
                    initialSelection: 'IN', // Initial country code
                    favorite: const ['+91'], // Your favorite country codes
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter Phone Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  hintText: 'Enter Message',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _openWhatsApp,
              child: const Text('Open WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}
// *********************min sdk version 21 , add file required in andr.xml , ios