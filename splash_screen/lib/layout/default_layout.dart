import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const DefaultLayout({
    required this.title,
    required this.children,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar를 사용하면 자동으로 라우트 스택 안에 뒤로가기 버튼이 생긴다.
      // AppBar를 사용하지 않으면 Navigator.pop()을 사용해야 한다.
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}