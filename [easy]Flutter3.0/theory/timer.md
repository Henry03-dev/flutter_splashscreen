import 'dart:async';

void main() {
  print('main 함수 실행');
  
  int number = 0;
  
  Timer.periodic(
    Duration(seconds:1),
    (Timer timer) {
      
      number ++;
      print('$number초 뒤에 실행한다!');
      
      if(number == 5) {
        timer.cancel();
      }
    },
  );
}