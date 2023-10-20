import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String socketUrl = "ws://16.171.108.70:8080/chat";
  IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    _initSocketConnection();
  }

  void _initSocketConnection() {
    socket = IO.io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket!.on('connect', (_) {
      print('socket connected');
    });

    socket!.on('disconnect', (_) {
      print('Disconnected from server');
    });

    // Add more event listeners for handling messages, chat updates, etc.

    socket!.connect();
  }

  @override
  void dispose() {
    socket?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Center(
        child: Text('Your chat UI goes here'),
      ),
    );
  }
}
