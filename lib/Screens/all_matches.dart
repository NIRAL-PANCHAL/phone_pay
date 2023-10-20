import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllMatches extends StatefulWidget {
  const AllMatches({Key? key}) : super(key: key);

  @override
  State<AllMatches> createState() => _AllMatchesState();
}

class _AllMatchesState extends State<AllMatches> {
  List alldata = [];
  final String apiUrl =
      'https://api.cricapi.com/v1/currentMatches?apikey=e7db6be7-3346-428b-bba6-29bf9f11c451&offset=0';
  List<String> textList = [
    "bhavin not found",
    "Abhi not found",
    "Nikunj not found",
    "Ashish not found",
    "Samir not found",
    "Ravi not found",
  ];
  bool showAdditionalContainer = false;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Assuming that the key in the response is 'data'
      final List<dynamic> data = responseData['data'];

      // Clear the list before adding new data
      alldata.clear();

      // Add each item in the data list separately to alldata
      for (var item in data) {
        setState(() {
          alldata.add(item);
        });
      }

      // Optionally, you can print alldata to see if it contains the expected data
      print(alldata);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    setState(() {
      fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              showAdditionalContainer = !showAdditionalContainer;
            });
          },
          child: Container(
            margin:
                const EdgeInsets.only(left: 10, bottom: 8, right: 15, top: 8),
            width: 100,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Text("Home"),
                Icon(showAdditionalContainer == false
                    ? Icons.arrow_upward
                    : Icons.arrow_downward)
              ],
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (context, index) {
          var datas = alldata[index];
          List<dynamic> teamInfoList = datas['teamInfo'];

          // Creating a list of Widgets to display team information
          List<Widget> teamWidgets = teamInfoList.map((teamInfo) {
            return Column(
              children: [
                Image.network(
                  teamInfo['name'] == "Australia"
                      ? "https://media.istockphoto.com/id/1340727526/vector/flags-of-australia-vector-icon-illustration.jpg?s=612x612&w=0&k=20&c=tyL_HkGKsFGnwMh41AdnfXSke7BlUaVNJewEgWzDYLQ="
                      : teamInfo['name'] == "India"
                          ? "https://media.istockphoto.com/id/519611160/vector/flag-of-india.jpg?s=612x612&w=0&k=20&c=0HueaQHkdGC4Fw87s3DbeTE9Orv3mqHRLce88LV47E4="
                          : teamInfo['name'] == "Afghanistan"
                              ? "https://media.istockphoto.com/id/1308970641/vector/highly-detailed-flag-of-afghanistan-afghanistan-flag-high-detail-vector-of-afghanistan-flag.jpg?s=612x612&w=0&k=20&c=lXKTFbwRmk-wUtxytnPMA38FLE5sZ4o-7MLpyCkO0Vk="
                              : teamInfo['name'] == "New Zealand"
                                  ? "https://media.istockphoto.com/id/657672808/vector/flag-of-new-zealand.jpg?s=612x612&w=0&k=20&c=_55qnOIAQqISU5snVYS6BwRjSe5D4UkHAIUkEFYu9dY="
                                  : teamInfo['img'],
                  width: 48,
                  height: 48,
                ),
                Text(
                  teamInfo['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            );
          }).toList();
          return Container(
            color: Colors.yellow,
            height: 150,
            padding: const EdgeInsets.only(top: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      datas['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Center(
                    child: Text(
                      datas['status'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Center(
                    child: Text(
                      datas['venue'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: teamWidgets,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              showAdditionalContainer = !showAdditionalContainer;
            });
          },
          child: Container(
            margin:
            const EdgeInsets.only(left: 10, bottom: 8, right: 15, top: 8),
            width: 100,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Home"),
                Icon(showAdditionalContainer == false
                    ? Icons.arrow_upward
                    : Icons.arrow_downward)
              ],
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // Your main content goes here
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  color: Colors.pink,
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              top: showAdditionalContainer ? 0 : -220,
              left: 0,
              right: 0,
              child: Container(
                height: 220,
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: textList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(textList[index],
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://plus.unsplash.com/premium_photo-1668606763482-8dd2042c934e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZG9nc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                                          fit: BoxFit.cover)),
                                )
                              ],
                            ),
                            Container(
                              height: 170,
                              width: 230,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name : Spaas"),
                                  Text("Missign Scince : 2002"),
                                  Text(
                                      "Last Location : Khodiyar manir thi chalto chalto khovay gayo"),
                                  Text("jati : nathi brobar lagtu"),
                                  Text(
                                      "mahiti : male ene daia java vinanti\nnakar paisa dai dejevabajb"),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    )*/
