import 'package:chap02_qestion/style/mybar_style.dart';
import 'package:flutter/material.dart';




void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: " 우리들의 첫 플러터 app"),
    );
  }


}


