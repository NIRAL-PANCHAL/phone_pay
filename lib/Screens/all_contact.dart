import 'dart:math';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_pay/Screens/pay_contact.dart';

class PayOption extends StatefulWidget {
  const PayOption({Key? key}) : super(key: key);

  @override
  State<PayOption> createState() => _PayOptionState();
}

class _PayOptionState extends State<PayOption> {
  List<Contact> _contacts = [];
  bool _isLoading = true; // Added loading state
  List<Contact> _filteredContacts = []; // List to store filtered contacts


  @override
  void initState() {
    super.initState();
    requestContactsPermission();
    loadContacts();
  }

  Future<void> requestContactsPermission() async {
    final PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      // Permission granted, load contacts
      loadContacts();
    } else {
      // Handle the case where permission is denied
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Permission Denied"),
            content: Text("Please grant access to contacts to fetch them."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

// Function to filter contacts based on search query
  void filterContacts(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show all contacts
        _filteredContacts = _contacts;
      } else {
        _filteredContacts = _contacts.where((contact) {
          final displayName = contact.displayName ?? "";
          final firstPhoneNumber = contact.phones?.isNotEmpty == true
              ? contact.phones![0].value ?? ""
              : "";
          return displayName.toLowerCase().contains(query.toLowerCase()) ||
              firstPhoneNumber.contains(query);
        }).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // Sort the contacts list alphabetically by display name
    _contacts.sort((a, b) => (a.displayName ?? "").compareTo(b.displayName ?? ""));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Colors.deepPurple,
        title: Text("Send money"),
      ),
      body: Column(
        children: [
          // Conditional loading widget
          if (_isLoading)
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              ),
            ) // Show loader while fetching contacts
          else
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo[100]
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                          Expanded(
                            child: TextField(
                              onChanged: filterContacts, // Call filterContacts on text change
                              decoration: InputDecoration(
                                hintText: "Enter a mobile number or name",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: _filteredContacts.length, // Use filtered contacts
                            itemBuilder: (context, index) {

                              Contact contact = _filteredContacts[index];

                              // Check if both display name and phone number are available
                              if (contact.displayName?.isNotEmpty == true &&
                                  contact.phones != null &&
                                  contact.phones!.isNotEmpty &&
                                  (contact.phones![0].value?.length ?? 0) >= 10) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Payment(
                                          personName: contact.displayName!,
                                          personNumber: contact.phones![0].value!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: getRandomColor(),
                                              child: Text(
                                                contact.displayName![0].toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(contact.displayName!),
                                                Text(
                                                  contact.phones![0].value!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        thickness: 0.5,
                                        indent: 50,
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                // Display an empty container for contacts without a name or phone number
                                return Container();
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  Future<void> loadContacts() async {
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _filteredContacts = _contacts; // Populate _filteredContacts with all contacts
      _isLoading = false; // Set loading state to false when contacts are fetched
    });
  }
}