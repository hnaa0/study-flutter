import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void onToggle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle ? const MyLargeTitle() : const Text("nothing"),
                IconButton(
                    onPressed: onToggle,
                    icon: const Icon(Icons.remove_red_eye)),
              ],
            ),
          ),
        ));
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  // initState는 build보다 먼저 호출되어야 하고 단 한 번만 호출됨.
  // 항상 사용해야할 필요는 없지만 대표적으로 api를 업데이트할 때 사용됨.
  void initState() {
    super.initState();
    print("initstate");
  }

  @override
  // 위젯이 스크린에서 제거될 때 호출되는 메서드.
  // api 업데이트, 이벤트리스너로부터 구독을 취소하거나 form의 리스너로부터 벗어나고 싶을 때 -> 무언가로부터 벗어나고 싶을 때 사용.
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  // context = 리액트의 useContext같은 느낌. 현재 클래스를 기준으로 부모에게 접근할 수 있도록 해줌.
  Widget build(BuildContext context) {
    print("build");
    return Text(
      "My Large Title",
      style: TextStyle(
          fontSize: 20, color: Theme.of(context).textTheme.titleLarge?.color),
    );
  }
}
