
import 'package:flutter/material.dart';
import './left_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          '首页',
          style: TextStyle(color: Colors.white),
          ),
        centerTitle:true,
        leading:Builder(builder: ((context) => 
               IconButton (
                  iconSize:30.0,
                  icon:const Icon( 
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed:(){
                    debugPrint('调用了');
                    Scaffold.of(context).openDrawer();
                  }
                )
        ))
      ),
      drawer:const LeftDrawerPage(),
      // drawer: drawerWidget(),
    );
  }


  Widget drawerWidget(){
    return Container(
      width: 200.0,
      child: const Text('抽屉'),
    );
  }
}

