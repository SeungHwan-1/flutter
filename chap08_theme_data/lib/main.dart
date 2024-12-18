import 'package:chap08_theme_data/TextTest.dart';
import 'package:flutter/material.dart';
import "style.dart" as style;
void main() {
  runApp(const MyApp());
}
/*
*
* */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: style.theme,
      home: MyPage(),
    );
  }
}
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [Icon(Icons.star),
      TextTest()],
      ),
      bottomNavigationBar: BottomAppBar( //우리스타일로만들고싶다
        child: Row(
          children: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],
        ),
      ),
    );


  }
}
