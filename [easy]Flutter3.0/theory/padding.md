padding 사용방식
- 위젯을 padding으로 감싸고 EdgeInsets.all로 padding 값 주기
ex:

child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        color: Colors.blue, 
        width: 50.0, 
        height: 50.0
    ),
),

EdgeInsets.all(a)
- 상하좌우 네면 모두 a 값으로 padding


EdgeInsets.symmetric(
    horizontal: a, 
    vertical: a,
)
- 대칭, 좌우 또는 상하에 padding,
- horizontal은 좌우, vertical은 상하


EdgeInsets.only(
    top: a, 
    left: a, 
    right: a, 
    bottom: a,
)
- 상하좌우 네면 모두 직접 커스터 마이징 가능


EdgeInsets.LTRB(
    32.0,
    64.0,
    16.0,
    8.0,
)
- Left, Top, Right, Bottom 순서대로 파라미터를 받는다.