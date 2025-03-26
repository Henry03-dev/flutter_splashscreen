WebViewController controller = WebViewController()
    ..loadRequest();

.. => 온점을 두개 붙이면 선언한 controller값에 loadRequest값이 아닌 WebViewController를 반환

- WebViewController().loadRequest();
=> loadRequest 반환
- WebViewController()..loadRequest();
=> WebViewController 반환

WebViewController controller = WebViewController()..loadRequest();
위 코드는

WebViewController controller = WebViewController();
controller.loadRequest();
와 같다.