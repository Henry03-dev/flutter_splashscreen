- Life Cycle

1. Constructor()
2. createState()

3. initState()
    - state class가 인스턴스화 되었을때 한번만 실행
    - context 제공 x, 사용 불가
4. didChangeDependencies()
    - context 제공, 사용가능
    - initState()가 실행된 뒤 바로 실행
    - state class가 의존하고 있는 의존성이 변동이 됐을때, 추가로 여러번 실행
        ex: Theme.of(), MediaQuery.of()
5. dirty
    - state class의 상태를 말함
    - 빌드가 실행되기 전의 상태는 dirty
    - 빌드를 실행해야 하는 상태
6. build()
7. clean
    - state class의 상태를 말함
    - 빌드가 실행된 후의 상태는 clean
8. deactivate()
    - state가 삭제된 경우에 실행
    - 주로 사용 x
9. dispose()
    - 화면에서 지워질 때 실행
    - 순차적으로 실행

setState()
- 빌드가 완료되어 화면에 위젯들이 그려진 clean 상태에서 setState()를 실행하면 state 상태를 다시 dirty 상태로 전환하여 빌드를 하는 구조이다.

didUpdateWidget()
- setState를 실행했다면, 
@override
State<widget> createState() => _WidgetState();를 다시 실행하지 않고,
기존의 StatefulWidget이 생성되었던 이력이 있다면 createState()를 실행하지 않고 createState()로 실행해서 생성되었던 state class를 찾는다.
그 후, 생성된 새로운 Constructor() 인스턴스와 state class를 연동하고 didUpdateWidget()이 실행된다.
state 상태를 dirty 상태로 전환하여 똑같이 빌드

-------------------------ex-----------------------------

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CodeFatoryWidget(),
          ],
        ),
      ),
    );
  }
}

class CodeFatoryWidget extends StatelessWidget {
  const CodeFatoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 50.0,
      height: 50.0,
    );
  }
}