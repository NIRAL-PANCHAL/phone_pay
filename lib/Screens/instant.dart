import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MtApps extends StatefulWidget {
  @override
  MtAppsState createState() {
    return new MtAppsState();
  }
}

class MtAppsState extends State<MtApps> {
  final imgUrl =
      "https://rr2---sn-npoldn76.googlevideo.com/videoplayback?expire=1696937160&ei=aOAkZai4Fdeg_9EPlLaaiAU&ip=102.129.235.38&id=o-ACrcwIWseY5IJ4gHLZWjeEo32zgwNaJuqiJGyTYLiTqH&itag=247&source=youtube&requiressl=yes&spc=UWF9f1GNOiAWJSzCkHrlcFwVirLYkb4&vprv=1&svpuc=1&mime=video%2Fwebm&gir=yes&clen=2194356&dur=15.133&lmt=1696829499300780&keepalive=yes&fexp=24007246,24350018&beids=24350018&c=ANDROID&txp=630A224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AGM4YrMwRgIhAKZpD84WockgP_GItaEENpsryqrASqq8kbQge4TCMzl3AiEAm2WGIHtSGX0iySuB170_hcX8iLjWw8l36fMzhkNxRd0%3D&redirect_counter=1&cm2rm=sn-p5qe7y7e&req_id=b5b806fee037a3ee&cms_redirect=yes&mh=LE&mip=2405:201:2023:bcab:a1ff:a774:8354:29a3&mm=34&mn=sn-npoldn76&ms=ltu&mt=1696915265&mv=m&mvi=2&pl=44&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AK1ks_kwRAIgdPx_S5_Sf3tYHFG0_7278NrJQyzCZFOEOoSIUB2wfH4CIDtlT8_wdjx03C37Z1ttX6sFojrG4Yn7AQvksp15pLcH";
  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();

    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      await dio.download(
        imgUrl,
        "DCIM/Camera/demo.mp4", // Change the path here
        onReceiveProgress: (rec, total) {
          print("Rec: $rec , Total: $total");
          print(dir.path);

          setState(() {
            downloading = true;
            progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
          });
        },
      );

    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Text("No Data"),
      ),
    );
  }
}
