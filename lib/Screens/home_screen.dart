import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:phone_pay/Screens/QrScanner.dart';
import 'package:phone_pay/Screens/all_contact.dart';
import 'package:phone_pay/Screens/chat_screen.dart';
import 'package:phone_pay/Screens/credit_card.dart';
import 'package:phone_pay/Screens/video_players.dart';
import 'package:phone_pay/Screens/vnjdvdjn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final List<IconData> iconDataList = [
    Icons.perm_identity,
    Icons.warehouse_sharp,
    Icons.stop_circle,
    Icons.money
  ];
  List accpountText = [
    "To Mobile\nNumber",
    "To Bank/\nUPI ID",
    "To Self\nAccount",
    "Check\nBalance"
  ];
  List _imageUrls = [
    'assets/pasted image 0.png',
    'assets/images.jpg',
    'assets/pasted image 0.png',
    'assets/images.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Color(0xff5f259e),
        leadingWidth: 60,
        leading: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePagesss()));
              },
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                height: 100,
                width: 40,
                child: Icon(Icons.perm_identity, color: Color(0xff5f259e)),
              ),
            ),
            Positioned(
                bottom: 7,
                right: -1,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/indina_flag.png",
                      ))),
                ))
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayerScreen()));
                    },
                    child: Text("Add Address")),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            Text(
              "India Colony",
              style: TextStyle(
                  fontSize: 12, color: Colors.white.withOpacity(0.70)),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditCard()));
            },
            icon: Icon(Icons.qr_code_scanner,),
            color: Colors.white,

          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications_outlined, color: Colors.white, size: 28),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.help_outline, color: Colors.white, size: 28),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: _imageUrls.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            _imageUrls[index],
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DotsIndicator(
                        dotsCount: _imageUrls.length,
                        position: _currentIndex.toInt(),
                        decorator: DotsDecorator(
                          activeColor: Colors.white,
                          activeSize: Size(10, 10),
                          spacing: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.19,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transfer Money",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: iconDataList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 48),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PayOption()));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff5f259e),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(iconDataList[index],
                                      color: Colors.white, size: 35),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(accpountText[index].toString(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
