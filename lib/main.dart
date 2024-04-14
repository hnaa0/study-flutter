import 'package:flutter/material.dart';

// flutter 관점의 widget = 레고블럭. flutter는 여러 레고블럭을 합쳐서 앱을 만듦.
// 프로그래밍언어 관점의 widget = class

class Player {
  String? name;

  Player({required this.name});
}

void main() {
  var nana = Player(name: "nana");
  nana.name;
  // runApp 함수에 주는 widget = root widget
  runApp(App());
}

// class를 widget으로 만드려면 flutter sdk의 3개의 core widget 중 하나를 상속받아야 함.
class App extends StatelessWidget {
  // 모든 widget은 build 메서드를 만들어야 함.
  // build 메서드는 widget의 ui를 만드는 역할.
  // flutter는 build 메서드가 뭘 리턴하던지 화면에 보여줌.

  @override
  Widget build(BuildContext context) {
    // root widget은 materialApp(구글 디자인 시스템), cupertinoApp(애플 디자인 시스템) 둘 중 하나를 리턴해야 함.
    // -> flutter에게 어떤 family 스타일을 사용할지 알려주는 것.
    return MaterialApp(
      // 모든 화면은 saffold(구조)를 가져야 함.
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello flutter!"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Text("hello world!"),
        ),
      ),
    );
  }
}
