import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/widget/button.dart';
import 'package:toonflix/widget/currency_card.dart';

// flutter 관점의 widget = 레고블럭. flutter는 여러 레고블럭을 합쳐서 앱을 만듦.
// 프로그래밍언어 관점의 widget = class

// use 'const' with the constructor to timporve performance
// const -> 수정할 수 없고 컴파일 전에 그 value를 알 수 있는 변수.
// 상수를 알려주면 app이 동작하는게 더 쉽기 때문에 const인 widget들을 const로 바꾸는게 낫다고 알려주는 것.
// 하지만 이걸 하나하나 수동으로 세팅하는건 불가능 -> setting.json에 "editor.codeActionsOnSave": {"source.fixAll": "explicit"} 추가

class Player {
  String? name;

  Player({required this.name});
}

void main() {
  var nana = Player(name: "nana");
  nana.name;
  // runApp 함수에 주는 widget = root widget
  runApp(const App());
}

// class를 widget으로 만드려면 flutter sdk의 3개의 core widget 중 하나를 상속받아야 함.
class App extends StatelessWidget {
  const App({super.key});

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
          backgroundColor: const Color(0xFF181818),
          // singlechildescrollview : 스크롤 가능하게 하는 위젯
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "hey Selena",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "welcome back!",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const Text(
                    "\$5 194 482",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: "Transfer",
                        bgColor: Color(0xFFF2B33A),
                        textColor: Colors.black,
                      ),
                      Button(
                        text: "Request",
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "wallets",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrenctCard(
                    name: "Euro",
                    code: "EUR",
                    amount: "6 428",
                    icon: Icons.euro_rounded,
                    isInverted: false,
                    order: 0,
                  ),
                  const CurrenctCard(
                    name: "Bitcoin",
                    code: "BTC",
                    amount: "9 468",
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                    order: 1,
                  ),
                  const CurrenctCard(
                    name: "Dollar",
                    code: "USD",
                    amount: "2 659",
                    icon: Icons.attach_money_rounded,
                    isInverted: false,
                    order: 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
