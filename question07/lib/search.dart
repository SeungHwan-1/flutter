import 'package:flutter/material.dart';

class search extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const search({super.key, required this.items});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final inputData1 = TextEditingController();
  List<Map<String, dynamic>> items2 = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: inputData1,
            decoration: const InputDecoration(hintText: "검색"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (inputData1.text.isNotEmpty) {
                  for (int i = 0; i < widget.items.length; i++) {
                    if (inputData1.text == widget.items[i]["title"]) {
                      items2.add({
                        'title': widget.items[i]["title"],
                        'content': widget.items[i]["content"],
                      });
                    }
                  }
                }

                // Clear input field after search
                inputData1.clear();
              });
            },
            child: const Text("확인"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items2.isEmpty ? 1 : items2.length,
              itemBuilder: (context, index) {
                if (items2.isNotEmpty) {
                  return ListTile(
                    title: Text(items2[index]['title'] ?? ''),
                    subtitle: Text(items2[index]['content'] ?? ''),
                  );
                } else {
                  // Display a message when no search results are found
                  return const ListTile(
                    title: Text("결과 없음"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
