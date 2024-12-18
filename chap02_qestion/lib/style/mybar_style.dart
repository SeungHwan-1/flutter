import 'package:flutter/material.dart';

import 'body_style.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("실습 앱"),
          ],),
        leading: Icon(Icons.arrow_back), //왼쪽
        actions: [
          Icon(Icons.star),
          SizedBox(width: 30),  // 아이콘 간격을 8픽셀로 설정
          Padding(
            padding: EdgeInsets.only(right: 50.0),  // 오른쪽에 12픽셀 여백 추가
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue,
      ),

      body:Column(children: [ for(int i = 0; i < 2 ;i++)Body(),],),

      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [IconButton(onPressed: handleButtonPress,
                icon:Icon(Icons.home)),Icon(Icons.search),Icon(Icons.menu),
              Icon(Icons.close)],
          ),
        ),
      ),
    );
  }
}

void handleButtonPress() {
  print('버튼이 눌렸습니다!');

}