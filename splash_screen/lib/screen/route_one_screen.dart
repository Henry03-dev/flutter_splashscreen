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
    return DefaultLayout(
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
    );
  }
}
