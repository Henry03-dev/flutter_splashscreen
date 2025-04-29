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
            ElevatedButton(
              // onpressed: null 이면 버튼 비활성화
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                /// 배경 색깔
                backgroundColor: Colors.red,
                disabledBackgroundColor: Colors.grey,
                // 배경 위의 색깔 (스플레시 색깔 포함)
                foregroundColor: Colors.black,
                // 그림자 색
                shadowColor: Colors.green,
                elevation: 10.0,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                padding: EdgeInsets.all(32.0),
                side: BorderSide(
                  color: Colors.black,
                  width: 12.0,
                ),
                // 최소 사이즈
                // minimumSize: Size(200, 150),
                // 최대 사이즈
                // maximumSize: Size(500, 300),
                // 사이즈 고정
                // fixedSize: Size(100, 150),
              ),
              child: Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                /// Material State
                /// 
                /// hovered - 호버링 상태(마우스 커서를 올려놓은)
                /// focused -  포커스 됐을때(텍스트 필드)
                /// pressed - 눌렀을때 
                /// dragged - 드래그 됐을떄
                /// selected - 선택 됐을때(체크박스, 라디오 버튼)
                /// scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을때
                /// disabled - 비활성화 됐을때
                /// error - 에러 상태일때
                /// all - 어떤 상태이던 항상 적용
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
              ),
              child: Text('Outlined Button'),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }

                    return Colors.black;
                  },
                ),
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) {
                    if(states.contains(MaterialState.pressed)) {
                      return Size(200, 150);
                    }
                    return Size(300, 200);
                  }
                ),
              ),
              child: Text('Text Button'),
            ),
            OutlinedButton(
              onPressed: () {}, 
              style: OutlinedButton.styleFrom(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
              ),
              child: Text('Outlined Button Shape'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_alt_outlined
              ),
              label: Text('키보드'),
              style: OutlinedButton.styleFrom(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}