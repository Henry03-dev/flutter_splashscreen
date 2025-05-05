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
