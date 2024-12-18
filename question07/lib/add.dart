import 'package:flutter/material.dart';

import 'navi.dart';

class Add extends StatefulWidget {

  final List<Map<String, dynamic>> items;
  final Function updateSelectedIndex;

  const Add({
    super.key,
    required this.items, required this.updateSelectedIndex

  });



  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final inputData1 = TextEditingController();
  final inputData2 = TextEditingController();

  get items => null;
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("이름 입력"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: inputData1, // 전달된 controller 사용
                decoration: const InputDecoration(hintText: "이름이 뭐에요"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: inputData2, // 전달된 controller 사용
                decoration: const InputDecoration(hintText: "내용이 뭐에요"),
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

                    widget.items.add({
                      'title': inputData1.text,
                      'content': inputData2.text,
                    });
                    // 입력 필드 초기화
                    inputData1.clear();
                    inputData2.clear();



                  }
                });
                Navigator.pop(context);
                widget.updateSelectedIndex(0);

              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _showAddDialog,
            child: const Text("이름 추가하기"),
          ),

        ],
      ),
    );
  }
}
