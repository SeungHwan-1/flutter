import 'package:chap10_spring_to_flutter/screen/main_screen.dart';
import 'package:chap10_spring_to_flutter/widgets/delete_widget.dart';
import 'package:chap10_spring_to_flutter/widgets/insert_widget.dart';
import 'package:chap10_spring_to_flutter/widgets/update_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/select_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 텝에 따라 표시할 화면들
  final List<Widget> _pages = [
    MainScreen(),
    MenuSelectWidget(),
    MenuInsertWidget(),
    MenuUpateWidget(),
    MenuDeleteWidget(),
  ];


  //  탭 선택시 호출 함수
  void _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Restaurant"),

        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "메뉴조회"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "메뉴등록"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "메뉴수정"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "메뉴삭"),
          ]),
    );
  }
}
