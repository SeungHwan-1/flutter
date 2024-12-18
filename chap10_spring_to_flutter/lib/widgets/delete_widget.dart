import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuDeleteWidget extends StatefulWidget {
  const MenuDeleteWidget({super.key});

  @override
  State<MenuDeleteWidget> createState() => _MenuDeleteWidgetState();
}

class _MenuDeleteWidgetState extends State<MenuDeleteWidget> {
  TextEditingController _menuNameController = TextEditingController();
  final MenuModel _menuModel = MenuModel();


  @override
  void initState() {
    super.initState();

  }

  // 메뉴 목록을 불러오는 함수

  void _deleteMenu() async {
    Map<String, dynamic> menuData = {
      'menuName': _menuNameController.text,
    };

    try {
      String result = await _menuModel.deleteMenu(menuData);
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
    return Padding( padding: EdgeInsets.all(16),
    child: Column(
    children: [
      TextField(
        controller: _menuNameController,
        decoration: InputDecoration(labelText: "메뉴 이름"),
      ),
      ElevatedButton(onPressed: _deleteMenu, child: Text("메뉴 삭제"))
    ]
    )
    );
  }
}
