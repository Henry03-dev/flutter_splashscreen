-----------------main.dart

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






-----------------------home_screen

import 'package:flutter/material.dart';
import 'package:splash_screen/screen/route_one_screen.dart';
import 'package:splash_screen/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      children: [
        OutlinedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const RouteOneScreen(
                    number: 20,
                  );
                },
              ),
            );
            print(result);
          },
          child: Text('Push'),
        ),
      ],
    );
  }
}


---------------------------------route_one_screen

import 'package:flutter/material.dart';
import 'package:splash_screen/layout/default_layout.dart';
import 'package:splash_screen/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({
    super.key,
    this.number,
    });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      /// false를 반환하면 appBar나 시스템에서 제공하는 뒤로가기가 불가능하다.
    child:  DefaultLayout(
        title: 'RouteOneScreen',
        children: [
          Text(
            'arguments: $number',
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(
                456,
              );
            },
            child: Text('Pop'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).maybePop(
                /// pop이 가능하면 pop을 하고
                /// pop이 불가능하면 false를 리턴한다.
                456,
              );
            },
            child: Text('Maybe Pop'),
          ),
          OutlinedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
              /// canPop은 현재 스택에 pop할 수 있는 화면이 있는지 확인한다.
              /// 현재 스택에 pop할 수 있는 화면이 있으면 true를 리턴하고
              /// 없으면 false를 리턴한다.
            },
            child: Text('Can Pop'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const RouteTwoScreen();
                  },
                  settings: RouteSettings(
                    arguments: 789,
                  ),
                ),
              );
            },
            child: Text('Push'),
          ),
        ],
      ),
    );
  }
}


----------------------route_two_screen

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splash_screen/layout/default_layout.dart';
import 'package:splash_screen/screen/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(arguments.toString(), textAlign: TextAlign.center),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Pop'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: '111111');
          },
          child: const Text('Push'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              // pushReplacement는 현재 화면을 스택에서 삭제하고 푸시
              MaterialPageRoute(
                builder: (context) {
                  return RouteThreeScreen();
                },
                settings: RouteSettings(
                  arguments: '222222',
                ),
              ),
            );
          },
          child: Text('Push Replacement'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              // Declarative 방식으로 라우트를 설정할 수 있다.
              // pushReplacementNamed는 현재 화면을 스택에서 삭제하고 푸시
              '/three',
              arguments: '999',
            );
          },
          child: Text('Push Replacement Named'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) {
                /// 만약에 삭제할거면 (Route Stack) false를 반환
                /// 삭제하지 않을거면 true를 반환
                return route.settings.name == '/';
                /// '/' 라우트를 제외한 모든 스택 삭제
              },
              arguments: '999',
            );
          },
          child: Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}


------------------------- route_three_screen.dart



import 'package:flutter/material.dart';
import 'package:splash_screen/layout/default_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    return DefaultLayout(
      title: 'RouteThreeScreen',
      children: [
        Text(
          arguments.toString(),
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: Text('Pop'),
        ),
      ],
    );
  }
}