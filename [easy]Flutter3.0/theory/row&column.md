1. Row
- Row는 가로로 위젯을 배치할 때 사용된다.

2. Column
- Column은 세로로 위젯을 배치할 때 사용된다.

- MainAxisAlignment는 주축, CrossAxisAlignment는 반대축이다.
- 특별한 제한사항이 없다면 Row 위젯과 Column 위젯의 주축은 최대 크기를 차지하고 반대축은 최소 크기를 차지한다.

MainAxisAlignment의 옵션들
- MainAxisAlignment.start : 주축의 시작에 정렬한다.
- MainAxisAlignment.end : 주축의 끝에 정렬한다.
- MainAxisAlignment.center : 주축의 중앙에 정렬한다.
- MainAxisAlignment.spaceBetween : 주축에서 위젯들 사이에 동일한 간격을 두고 정렬한다.
- MainAxisAlignment.spaceAround : 주축에서 위젯들 주변에 동일한 간격을 두고 정렬한다.
- MainAxisAlignment.spaceEvenly : 주축에서 위젯들 앞뒤 및 사이에 동일한 간격을 두고 정렬한다.

CrossAxisAlignment의 옵션들
- CrossAxisAlignment.start : 반대축의 시작에 정렬한다.
- CrossAxisAlignment.end : 반대축의 끝에 정렬한다.
- CrossAxisAlignment.center : 반대축의 중앙에 정렬한다.
- CrossAxisAlignment.stretch : 반대축으로 위젯들을 최대로 확장한다.
- CrossAxisAlignment.baseline : 텍스트 기준선을 기준으로 위젯을 정렬한다.

Container
- 위젯들을 포함시키기 위함

Expanded
- Expanded를 사용하면 Expanded 위젯끼리 상위 위젯에서 분배된 화면을 나누어서 꽉채움 => flex를 사용해서 남는 공간끼리 차지할 비율을 설정가능

Expanded(
    flex: 1,
    child: Container(
        height: 50.0,
        width: 50.0,
        color: Colors.red,
    ),
),

Flexible

Flexible(
    flex: 1,
    fit: FlexFit.tight,
    child: Container(
        height: 50.0,
        width: 50.0,
        color: Colors.red,
    ),
),

-----------------------------------------------------

import 'package:flutter/material.dart';
import 'package:splash_screen/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 상태바를 제외한 위치부터 시작
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: colors.map(
              (e) => Container(
                height: 50.0,
                width: 50.0,
                color: e,
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}


--------Challenge--------

import 'package:flutter/material.dart';
import 'package:splash_screen/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: colors.map(
                  (e) => Container(
                    height: 50.0,
                    width: 50.0,
                    color: e,
                  ),
                ).toList(),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.orange,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: colors.map(
                  (e) => Container(
                    height: 50.0,
                    width: 50.0,
                    color: e,
                  ),
                ).toList(),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.green,
              ),
            ],
          ),
        )
      ),
    );
  }
}