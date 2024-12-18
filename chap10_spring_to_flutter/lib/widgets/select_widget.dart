import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuSelectWidget extends StatefulWidget {
  const MenuSelectWidget({super.key});

  @override
  State<MenuSelectWidget> createState() => _MenuSelectWidgetState();
}

class _MenuSelectWidgetState extends State<MenuSelectWidget> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu; // 선택된 메뉴

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  // 메뉴 목록을 불러오는 함수
  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _menus.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(_menus[i]['menuName']),
                    subtitle: Text(_menus[i]['menuPrice'].toString(),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  //쌓을때 필요한 위젯  백버튼 같은거 생김
                                  DetailPage(
                                      productName:
                                          _menus[i]['menuName'] ?? "이름없음",
                                      productDescription:
                                          _menus[i]['menuPrice'].toString(),
                                    productDescription1:
                                            _menus[i]['categoryCode'].toString(),
                                    productDescription2:
                                             _menus[i]['orderableStatus'],
                                              ),
                          )

                      );

                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productDescription1;
  final String productDescription2;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productDescription1,
    required this.productDescription2
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ Row(
              children: [const Text("메뉴이름:"),Text(
                productName,
                style: TextStyle(fontSize: 20),
              ),],
            ),
              Row(
                children: [Text("가격:"),Text(
                  productDescription,
                  style: TextStyle(fontSize: 20),
                ),],
              ),
              Row(
                children: [Text("카테고리 코드:"),Text(
                  productDescription1,
                  style: TextStyle(fontSize: 20),
                ),],
              ),
              Row(
                children: [Text("주문가능 상태:"),Text(
                  productDescription2,
                  style: TextStyle(fontSize: 20),
                ),],
              ),
            ],
          )),
    );
  }
}
