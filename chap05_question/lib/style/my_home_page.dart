import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputData1 = TextEditingController();
  final inputData2 = TextEditingController();
  String name1 = "null";
  String name2 = "null";

  List<Map<String, dynamic>> items = [
    {'title': '1번','content' : '33'},
    {'title': '2번','content' : '33'},
    {'title': '3번','content' : '33'},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length, // 리스트의 길이
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Text((i + 1).toString()),
                    title: Text(items[i]['title']), // title 출력

                    onTap: (){
                      showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(items[i]['title']),
                          content: Text(items[i]['content']),
                            actions: [
                            TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("닫기")),
                        ],
                        );
                      });


                    },
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          items.removeAt(i); // 해당 아이템 삭제
                        });
                      },
                      child: const Text("삭제"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),










      floatingActionButton: ElevatedButton(
        child: const Text(
          "등록",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("이름 입력"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: inputData1,
                      decoration: const InputDecoration(hintText: "이름이 뭐에요"),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: inputData2,
                      decoration: const InputDecoration(hintText: "내용이뭐에요"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("취소"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (inputData1.text.isNotEmpty && inputData2.text.isNotEmpty) {
                          // title과 content를 함께 추가
                          items.add({
                            'title': inputData1.text,
                            'content': inputData2.text,
                          });
                          // 입력 필드 초기화
                          inputData1.clear();
                          inputData2.clear();
                        }
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("확인"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
