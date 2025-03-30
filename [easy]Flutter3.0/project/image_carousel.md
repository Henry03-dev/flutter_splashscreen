flutter curves

--------------mybuild--------------------

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      Duration(seconds:1),
      (Timer timer) {
        setState(() {
          number ++;
        });

        if (number == 5) {
          timer.cancel();
        }
      }
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // 타이머 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Image.asset(
            'asset/img/image_$number.jpeg', 
            fit: BoxFit.cover
          ),
        ]
      ),
    );
  }
}

------------------class-------------------

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage < 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children:
            [1, 2, 3, 4, 5]
                .map(
                  (e) =>
                      Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover),
                )
                .toList(),
      ),
    );
  }
}
