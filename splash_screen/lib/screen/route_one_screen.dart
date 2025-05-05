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
