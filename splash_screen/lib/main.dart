import 'package:flutter/material.dart';
import 'package:splash_screen/screen/home_screen.dart';
import 'package:splash_screen/screen/route_one_screen.dart';
import 'package:splash_screen/screen/route_two_screen.dart';
import 'package:splash_screen/screen/route_three_screen.dart';

void main() {
  /// Flutter 프레임워크가 실행할 준비가 될때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();

  /// Imperative vs Declarative
  runApp(
    MaterialApp(
      /// home: HomeScreen(), 홈스크린 위젯을 직접 넣어주지 않고
      /// initialRoute를 사용해서 초기 라우트를 설정할 수 있다.
      initialRoute: '/',  // 앱이 시작할 때 보여줄 라우트 이름
      routes: {
        /// key - 라우트 이름
        /// value - builder -> 이동하고 싶은 라우트
        '/': (BuildContext context) => HomeScreen(),
        '/one': (context) => const RouteOneScreen(
          number: 999,
        ),
        '/two': (context) => const RouteTwoScreen(),
        '/three': (context) => const RouteThreeScreen(),
        /// Declarative 방식으로 라우트를 설정할 수 있다.
      },
    ),
  );
}