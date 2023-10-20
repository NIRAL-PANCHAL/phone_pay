import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';



class QRViewExample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExample1State();
}

class _QRViewExample1State extends State<QRViewExample1> {
  late QRViewController controller;
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Process the scanned data to extract UPI ID and mobile number
      if (scanData.code != null) {
        processScannedData(scanData.code!); // Use scanData.code! to unwrap the nullable string
      }
    });
  }

  void processScannedData(String data) {
    // Assume the QR code contains UPI ID and mobile number separated by a delimiter
    List<String> qrData = data.split(';');

    if (qrData.length == 2) {
      String upiId = qrData[0];
      String mobileNumber = qrData[1];

      // Now you have UPI ID and mobile number, you can use them as needed
      print('UPI ID: $upiId');
      print('Mobile Number: $mobileNumber');
    } else {
      print('Invalid QR code format');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
