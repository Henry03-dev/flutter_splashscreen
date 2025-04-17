import 'package:flutter/material.dart';
import 'package:splash_screen/const/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

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
                maxNumber: maxNumber,
              ),
              _Slider(),
              _Button(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('저장!'),
    );
  }
}

class _Number extends StatelessWidget {
  double maxNumber;

  _Number({
    required this.maxNumber,  
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: maxNumber
        .toInt()
        .toString()
        .split('')
        .map(
          (number) => Image.asset(
            'asset/img/$number.png',
            width: 50.0,
            height: 70.0,
          ),
        )
          .toList(),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(),
    );
  }
}