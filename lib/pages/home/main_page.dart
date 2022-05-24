import 'package:flutter/material.dart';

import 'home_page.dart';
import 'find_page.dart';
import 'mine_page.dart';

class MainPage extends StatefulWidget {
 const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 static const _items =[
      BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'首页'
          ),
      BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label:'发现'
          ),
      BottomNavigationBarItem(
            icon: Icon(Icons.flip_outlined),
            label:'我的'
          ),
  ];
  int _currentIndex=0;
  List pageList=[const HomePage(), const FindPage(),const MinePage()];
  void _handleCurrent(index) {
    debugPrint('当前选中的下标:$index');
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('主页面'),
      // ),
      body:pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize:18.0,
        unselectedFontSize: 14.0,
        iconSize:26.0,
        currentIndex: _currentIndex,
        items: _items,
        onTap: _handleCurrent,
      ),
    );
  }
}