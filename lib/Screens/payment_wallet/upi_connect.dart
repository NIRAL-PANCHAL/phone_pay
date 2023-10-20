import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyPlayerWidget extends StatefulWidget {
  const SpotifyPlayerWidget({super.key});

  @override
  _SpotifyPlayerWidgetState createState() => _SpotifyPlayerWidgetState();
}

class _SpotifyPlayerWidgetState extends State<SpotifyPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify Player'),
      ),
      body: const WebView(
        initialUrl: 'https://open.spotify.com/album/5pAPEuGi48iywzO2NT5Ddt',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
