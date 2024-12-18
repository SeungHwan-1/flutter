import 'package:chap04_stateful_widget/stateful/01_problem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'stateful/02_sateful.dart';
import 'stateful/03_question.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(


        title: Center(child: Text("Stateful widget"),
        ),
      ),
      //floatingActionButton:
      //문제점확인
     // StatelessTest(),
      body: StatefulTest2(),

    );
  }
}

