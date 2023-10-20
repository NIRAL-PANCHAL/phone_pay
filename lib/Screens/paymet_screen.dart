import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();

    // Handle incoming deep links
    getInitialLink().then((String? link) {
      if (link != null) {
        // Parse the deep link and extract the UPI ID
        final upiId = link.replaceFirst('yourapp://pay/',
            ''); // Replace 'yourapp' with your app's custom URL scheme
        redirectToGooglePay(upiId);
      }
    });

    // Listen for future deep links
    getLinksStream().listen((String? link) {
      if (link != null) {
        // Parse the deep link and extract the UPI ID
        final upiId = link.replaceFirst('yourapp://pay/',
            ''); // Replace 'yourapp' with your app's custom URL scheme
        redirectToGooglePay(upiId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Deep Link Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final upiId =
                  'panchalniral007-1@okhdfcbank'; // Replace with the UPI ID you want to pay.
              redirectToGooglePay(upiId);
            },
            child: Text('Pay with Google Pay'),
          ),
        ),
      ),
    );
  }

  Future<void> redirectToGooglePay(String upiId) async {
    final url = 'upi://pay?pa=$upiId'; // Google Pay deep link format
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where Google Pay couldn't be launched
    }
  }
}
