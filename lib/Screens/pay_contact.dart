import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  String? personName;
  String? personNumber;

  Payment({super.key, this.personName, this.personNumber});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController textController = TextEditingController();
  List<String> enteredTexts = [];
  bool showPayButtonOnly = false;
  bool isPaymentDone = false;

  void initState() {
    super.initState();

    // Handle incoming deep links
    getInitialLink().then((String? link) {
      if (link != null) {
        // Parse the deep link and extract any relevant information
        final upiId = link.replaceFirst('yourapp://pay/', ''); // Replace 'yourapp' with your app's custom URL scheme

        // Check if the deep link indicates a successful payment
        if (upiId == 'paymentdone') {
          setState(() {
            isPaymentDone = true;
          });
        }
      }
    });

    // Listen for future deep links
    getLinksStream().listen((String? link) {
      if (link != null) {
        // Parse the deep link and extract the UPI ID
        final upiId = link.replaceFirst('yourapp://pay/',
            ''); // Replace 'yourapp' with your app's custom URL scheme
        redirectToPhonePe('panchalniral007-1@okhdfcbank', "20");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.personName.toString(),
              style: const TextStyle(fontSize: 15),
            ),
            Text(
              widget.personNumber.toString(),
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.question_mark_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.indigo[100]),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              Spacer(),
              Column(
                children: enteredTexts
                    .map((text) =>
                    Container(
                      margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            height: 35,
                            child: isPaymentDone
                                ? Text(
                              'Payment Done',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // You can customize the color
                              ),
                            )
                                : Text(
                              text, // Display the entered text
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ))
                    .toList(),
              ),
              Container(
                height: 50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          // Check if the text starts with a digit
                          setState(() {
                            showPayButtonOnly =
                                text.startsWith(RegExp(r'[0-9]'));
                          });
                        },
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "Enter amount or chat",
                          border: InputBorder.none, // Remove the border
                        ),
                      ),
                    ),
                    if (showPayButtonOnly)
                      ElevatedButton(
                        onPressed: () {
                          if (double.tryParse(textController.text) != null) {
                            final amount = textController.text;
                            final upiId = 'panchalniral007-1@okhdfcbank?amount=$amount';
                            redirectToPhonePe('panchalniral007-1@okhdfcbank', amount);
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text(
                          "Pay",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                    if (showPayButtonOnly == false)
                      Row(children: [
                        IconButton(
                          onPressed: () {
                            final upiId =
                                'panchalniral007-1@okhdfcbank'; // Replace with the UPI ID you want to pay.
                            redirectToPhonePe(
                                'panchalniral007-1@okhdfcbank', "20");
                          },
                          icon: const Icon(Icons.image),
                        ),
                        IconButton(
                          onPressed: () {
                            final upiId =
                                'panchalniral007-1@okhdfcbank'; // Replace with the UPI ID you want to pay.
                            redirectToPhonePe(
                                'panchalniral007-1@okhdfcbank', "20");
                          },
                          icon: const Icon(Icons.add_circle_outline_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            final text = textController.text.trim();

                            // Check if the text is not empty
                            if (text.isNotEmpty) {
                              setState(() {
                                enteredTexts.add(
                                    text); // Add the entered text to the list
                                textController.clear(); // Clear the TextField
                              });

                              // Construct the UPI ID using the text if needed
                              final upiId = text;
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> redirectToPhonePe(String upiId, String amount) async {
    final url = 'upi://pay?pa=$upiId&pn=MerchantName&mc=12345&tid=12345&tr=12345&tn=Payment%20for%20User%20&am=$amount';
    // Replace MerchantName, 12345, and Payment%20for%20Purchase%20XYZ with your own values as needed

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the case where PhonePe couldn't be launched
    }
  }
}
