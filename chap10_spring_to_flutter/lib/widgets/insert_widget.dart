import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class MenuInsertWidget extends StatefulWidget {
  const MenuInsertWidget({super.key});

  @override
  State<MenuInsertWidget> createState() => _MenuInsertWidgetState();
}

class _MenuInsertWidgetState extends State<MenuInsertWidget> {
  TextEditingController _menuNameController = TextEditingController();
  TextEditingController _menuPirceController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _orderableController = TextEditingController();

  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu; // 선택된 메뉴

  @override
  void initState() {
    super.initState();

  }

  // 메뉴 목록을 불러오는 함수


  void _insertMenu() async {
    Map<String, dynamic> menuData = {
      'menuName': _menuNameController.text,
      'menuPrice': int.parse(_menuPirceController.text),
      'categoryCode': int.parse(_categoryController.text),
      'orderableStatus': _orderableController.text,
    };

    try {
      String result = await _menuModel.insertMenu(menuData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [

          TextField(
            controller: _menuNameController,
            decoration: InputDecoration(labelText: "메뉴 이름"),
          ),
          TextField(
            controller: _menuPirceController,
            decoration: InputDecoration(labelText: "메뉴 가격"),
          ),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: "카테고리 코드"),
          ),
          TextField(
            controller: _orderableController,
            decoration: InputDecoration(labelText: "판매 여부"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: _insertMenu, child: Text("메뉴 삽입"))
        ],
      ),
    );
  }

}
