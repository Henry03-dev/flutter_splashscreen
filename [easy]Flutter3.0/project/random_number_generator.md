theory
- SringSplit

final numbers1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];

final numbers2 = [
    123,
    456,
    789,
];

생성한 난수가 저장되어 있는 numbers2 리스트를 위젯으로 사용할 수 있는 numbers1  형태로 만드는데 StringSplit을 사용한다.

ex)

print('123'.split(''));

split에 공백을 두면 한글자 단위로 나눔

final numbers3 = numbers2
    .map(
        (e) => e.toString().split(
            '',
            ),
        ).toList();

-------------------------home_screen----------------------

import 'package:flutter/material.dart';
import 'package:splash_screen/component/number_to_image.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import 'package:splash_screen/const/color.dart';
import 'package:splash_screen/screen/setting_screen.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 제목과 아이콘 버튼이 있는곳
              _Header(
                onPressed: onSettingIconPressed
              ),

              /// 숫자가 있는곳
              _Body(
                numbers: numbers
              ),

              /// 버튼이 있는곳
              _Footer(
                onPressed: generateRandomNumber
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSettingIconPressed() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );
    // push의 메서드에 async를 주고 Navigator를 result 변수화해서 await를 하면
    // 하위 페이지에서 pop안에 준 값이 result값에 반환
    maxNumber = result;
  }

  generateRandomNumber() {
    final rand = Random();

    final Set<int> newNumbers = {};
    // Set에는 중복되는 값이 들어가지 못함

    while (newNumbers.length < 3) {
      final randomNumber = rand.nextInt(maxNumber);
      newNumbers.add(randomNumber);
    }

    setState(() {
      numbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: onPressed,
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({required this.numbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Expanded로 최대로 확장하기
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers.map((e) => NumberToImage(number: e)).toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      child: Text('생성하기!'),
    );
  }
}

---------------------setting_screen----------------------


import 'package:flutter/material.dart';
import 'package:splash_screen/component/number_to_image.dart';
import 'package:splash_screen/const/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;

  const SettingScreen({
    required this.maxNumber,
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber
              ),
              _Slider(
                value: maxNumber, onChanged: onSliderChanged
              ),
              _Button(
                onPressed: onSavePressed
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSavePressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }

  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;

  const _Button({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text('저장!'),
    );
  }
}

class _Number extends StatelessWidget {
  double maxNumber = 1000;

  _Number({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberToImage(
        number: maxNumber.toInt()
      )
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: blueColor,
      onChanged: onChanged,
    );
  }
}
