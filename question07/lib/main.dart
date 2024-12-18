import 'package:flutter/material.dart';
import 'package:question07/add.dart';
import 'package:question07/navi.dart';

import 'search.dart';

void main() {
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

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyAppState();
}

class _MyAppState extends State<MyPage> {
  final inputData1 = TextEditingController();
  final inputData2 = TextEditingController();
  List<Map<String, dynamic>> items = [
    {'title': '1번','content' : '33'},
    {'title': '2번','content' : '33'},
    {'title': '3번','content' : '33'},
  ];
  int _selectedIndex = 0;
  void updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 선택된 페이지를 반환하는 함수
  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return NavigationPage(items: items,);
      case 1:
        return Add(items: items, updateSelectedIndex: updateSelectedIndex,);
      case 2:
        return search(items: items,);
      default:
        return Center(child: Text("페이지없음"));
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "영화목록",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "영화등록",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation_outlined),
            label: "영화검색",
            activeIcon: Icon(Icons.navigation),
          ),
        ],
      ),

    );
  }
}
