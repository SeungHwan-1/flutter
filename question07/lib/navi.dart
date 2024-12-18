import 'package:flutter/material.dart';

/*
*  네비게이터 (Navigator)
* - 플러터에서 화면 전환을 관리하는 위젯이다.
* - 스택 구조를 사용하여 화면을 위에 쌓거나, 아래로
* 제거 함으로서 유저가 여러 화면 사이를 탐색할 수 있게
* 도와준다.
* - push - 새로운 화면을 스택 위에 추가
* - pop - 스택에서 현재 화면 제거
* */

class NavigationPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const NavigationPage({super.key,
    required this.items});



  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, i) {
          final item = widget.items[i];
          return ListTile(
            title: Text(item["title"] ?? "이름없음"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  //쌓을때 필요한 위젯  백버튼 같은거 생김
                  DetailPage(productName: item["title"] ?? "이름없음",
                             productDescription: item['content'] ?? "내용없음")));
            },
          );
        });
  }
}
// 상세 페이지



class DetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
        body: Padding(padding: EdgeInsets.all(16),
        child: Text(productDescription,
        style: TextStyle(fontSize: 20),
        ),
        ),
    );
  }
}
