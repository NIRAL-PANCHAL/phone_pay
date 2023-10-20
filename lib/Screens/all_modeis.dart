import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:phone_pay/Screens/widetss.dart';
import 'package:phone_pay/models/getData_reponse_model.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  List<Dataam> allDatta = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.29.240:5000/api/data'));

    if (response.statusCode == 200) {
      // Parse the response and add each item to the list
      List<Dataam> data = (json.decode(response.body)['data'] as List)
          .map((item) => Dataam.fromJson(item))
          .toList();

      setState(() {
        allDatta.addAll(data);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child:   InViewNotifierList(
              scrollDirection: Axis.vertical,
              initialInViewIds: ['0'],
              isInViewPortCondition:
                  (double deltaTop, double deltaBottom, double viewPortDimension) {
                return deltaTop < (0.5 * viewPortDimension) &&
                    deltaBottom > (0.5 * viewPortDimension);
              },
              itemCount: allDatta.length,
              builder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20,right: 10,left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        allDatta[index].userImage.toString()),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          Text(
                            allDatta[index].username.toString(),
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: allDatta[index].media![0].type == "image"
                            ? Image.network(
                          allDatta[index].media![0].url.toString(),
                        )
                            : VideoPlayerWidget(
                          videoUrl:
                          allDatta[index].media![0].url.toString(),
                          data: allDatta[index],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
