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
