import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _urlController = TextEditingController();
  bool loading = false;
  double progress = 0;
  bool downloading = false;

  Future<void> downloadFile() async {
    try {
      setState(() {
        downloading = true;
        progress = 0;
      });

      final taskId = await FlutterDownloader.enqueue(
        url: _urlController.text,
        savedDir: (await getApplicationDocumentsDirectory()).path,
        fileName: "downloaded_video.mp4",
        showNotification: true,
        openFileFromNotification: true,
      );

      // Poll the download status
      bool isDownloaded = false;
      while (!isDownloaded) {
        final tasks = await FlutterDownloader.loadTasks();
        final task = tasks!.firstWhere(
          (element) => element.taskId == taskId,
          orElse: () => DownloadTask(
            taskId: 'default_task_id',
            status: DownloadTaskStatus.complete,
            progress: 0,
            url: _urlController.text,
            filename: 'new',
            savedDir: '',
            timeCreated: 10,
            allowCellular: true,
          ),
        );

        if (task != null && task.status == DownloadTaskStatus.complete) {
          isDownloaded = true;
        } else {
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      setState(() {
        downloading = false;
      });

      print("File Downloaded");
    } catch (e) {
      setState(() {
        downloading = false;
      });
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Download Video",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
        actions: const [],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              controller: _urlController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Paste the link for download the video!",
                hintStyle: TextStyle(color: Colors.red.shade200),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text("Download"),
          ),
          _urlController.text.isEmpty
              ? Container()
              : Expanded(
                  child: WebView(
                    initialUrl: _urlController.text,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (String url) {
                      // Now you can extract the video link and use it
                      print("Page finished loading: $url");
                    },
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          loading
              ? BlinkText('Downloading....',
                  style: TextStyle(fontSize: 48.0, color: Colors.redAccent),
                  beginColor: Colors.black,
                  endColor: Colors.orange,
                  times: 10,
                  duration: Duration(seconds: 1))
              : GestureDetector(
                  onTap: () async {
                    try {
                      setState(() {
                        loading = true;
                      });
                      await downloadFile();
                      print("File Downloaded");
                    } catch (e) {
                      print("Error downloading file: $e");
                      // Handle the error as needed
                    } finally {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: const Text(
                      "Download Video!",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
