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



<cycle1 : setState()로 전체 Life Cycle을 반복>
-------------------------ex1-----------------------------

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
      width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show) CodeFactoryWidget(), 
            // 리스트 안에서 if문 사용가능
            // if 값이 참일때 다음 위젯 반환
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              }, 
              child: Text('클릭해서 보이기, 안보이기'),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  CodeFactoryWidget({super.key}) {
    print('1. Stateful Widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2. Stateful Widget Create State');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  @override
  void initState() {
    print('3. Stateful Widget initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('4. Stateful Widget didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5. Stateful Widget build');

    return Container(
      color: Colors.red,
      width: 50.0,
      height: 50.0,
    );
  }

  @override
  void deactivate() {
    print('6. Stateful Widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7. Stateful Widget dispose');
    super.dispose();
  }
}
<cycle2: setState()로 build cycle만 반복>
-------------------------ex2----------------------------
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
      width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show) CodeFactoryWidget(), 
            // 리스트 안에서 if문 사용가능
            // if 값이 참일때 다음 위젯 반환
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              }, 
              child: Text('클릭해서 보이기, 안보이기'),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  CodeFactoryWidget({super.key}) {
    print('1. Stateful Widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2. Stateful Widget Create State');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  Color color = Colors.red;

  @override
  void initState() {
    print('3. Stateful Widget initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('4. Stateful Widget didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5. Stateful Widget build');

    return GestureDetector(
      onTap: () {
        setState(() {
          color = color == Colors.red ? Colors.blue : Colors.red;
        });
      },
      child: Container(
        color: color,
        width: 50.0,
        height: 50.0,
      ),
    );

  }

  @override
  void deactivate() {
    print('6. Stateful Widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7. Stateful Widget dispose');
    super.dispose();
  }
}

<cycle3: 1 ~ 5 실행 후, State<widget> createState() => _WidgetState();를 다시 실행하지 않고,
기존의 StatefulWidget이 생성되었던 이력이 있다면 createState()를 실행하지 않고 createState()로 실행해서 생성되었던 state class를 찾는다.
그 후, 생성된 새로운 Constructor() 인스턴스와 state class를 연동하고 didUpdateWidget()이 실행된다.
state 상태를 dirty 상태로 전환하여 똑같이 빌드>
-------------------------------ex------------------------------
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  bool show = false;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
      width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show) GestureDetector(
              onTap: (){
                setState(() {
                  color = color == Colors.blue ? Colors.red : Colors.blue;
                });
              },
              child: CodeFactoryWidget(
                color: color,
              ), 
            ),
            // 리스트 안에서 if문 사용가능
            // if 값이 참일때 다음 위젯 반환
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              }, 
              child: Text('클릭해서 보이기, 안보이기'),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  final Color color;

  CodeFactoryWidget({
    super.key,
    required this.color,
    }) {
    print('1) Stateful Widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2) Stateful Widget Create State');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {


  @override
  void initState() {
    print('3) Stateful Widget initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('4) Stateful Widget didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5) Stateful Widget build');

    return Container(
      color: widget.color,
      width: 50.0,
      height: 50.0,
    );

  }

  @override
  void deactivate() {
    print('6) Stateful Widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7) Stateful Widget dispose');
    super.dispose();
  }
}