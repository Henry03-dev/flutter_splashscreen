- home_screen.dart

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  WebViewController controller = WebViewController()
    // ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);
    
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Code Factory'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: (){
                controller.loadRequest(homeUrl);
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ],
        ),
        body: WebViewWidget(
          controller: controller,
        ),
    );
  }
}


- main.dart

import 'package:flutter/material.dart';
import 'package:splash_screen/screen/home_screen.dart';

void main() {
  /// Flutter 프레임워크가 실행할 준비가 될때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
