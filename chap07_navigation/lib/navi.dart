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
  const NavigationPage({super.key}, required String );

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Map<String, String>> products = [
    {"name": "상품1", "description": "상품 1의 상세 정보"},
    {"name": "상품2", "description": "상품 2의 상세 정보"},
    {"name": "상품3", "description": "상품 3의 상세 정보"},
    {"description": "상품 3의 상세 정보"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final product = products[i];
          return ListTile(
            title: Text(product["name"] ?? "이름없음"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  //쌓을때 필요한 위젯  백버튼 같은거 생김
                  DetailPage(productName: product["name"] ?? "이름없음",
                      productDescription: product['description'] ?? "내용없음")));
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
