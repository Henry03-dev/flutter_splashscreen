Constraint 
=> 제약(위에서부터 아래로 내려가면서 실행)
1. Single Pass => 밑에 있는 것들을 한번만 계산

2. Constraints Go Down 위에서부터 아래로 전가
3. Sizes Go Up 크기는 위로 올라감
4. Parent Sets Position 부모가 위치를 정함

- 자식 위젯은 부모 위젯이 제한하고 있는 constraint 내부에서만 크기를 가져갈 수 있다.
- 위젯의 위치는 부모 위젯이 지정하기 때문에 위젯은 자신이 정확히 어디에 위치될지 알 수 없다. (플러터에서 x, y좌표로 위젯을 배치하지 않는 이유)
- 자식 위젯이 어디에 정렬돼야하는지 정확히 알 수 없는 경우에는 자식 위젯의 크기가 무시될 수 있다. (중요!!!!!)
=> 자식 위젯 정렬을 위한 기준을 만들어주어야한다. (Rows, Column, Center)
=> 그렇지 않으면 설정한 자식 위젯의 크기가 무시된다.

-----------------------ex------------------------



import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.red,
          child: Column(
            children: [
              Container(
              height: 50,
                width: 50,
              color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Alignment
child: Align(
  alignment: Alignment.(center, bottomRight, topLeft),
  alignment: Alignment(
    0, 0,
  ),
),
하위 위젯의 상세한 위치 조정이 가능
x, y좌표도 가능
=> x, y좌표별 상위 위젯을 기준으로 -1 ~ 1로 좌표분할e