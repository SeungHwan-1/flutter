import 'package:flutter/material.dart';

/*
* showDialog() - 틀러터가 제공하는 기본 함수
* context 를 넣어줘야 한다..
* 
* 플러터에서는 특별한 함수들이 몇 개 존재하는데
* Navigator(), Theme.of(), showDialog() 등등은
* context 를 넣어줘야 정상적으로 작동한다*/

class DialogTest extends StatelessWidget {
  const DialogTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){
        showDialog(context: context,
            builder: (context){
          return Dialog(
            child: Container(
              width: 150,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("반갑습니다"),Text("반갑습니다")],
              ),
              ),
            );
              });
             },
            child: Text("버튼",
        style: TextStyle(fontSize: 30),)),

    );
  }
}
