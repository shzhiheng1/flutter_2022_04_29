import 'package:flutter/material.dart';

class LeftDrawerPage extends StatelessWidget {
  const LeftDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            // child: DrawerHeader(
            //     child: Center(
            //       child: Text('header'),
            //     ),
            // ),
            child: UserAccountsDrawerHeader(
              accountEmail: new Text('https://www.baidu.com'),
              accountName: new Text('我是一个好人'),
              currentAccountPicture: new CircleAvatar(
                    backgroundImage:NetworkImage('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fff%2F92%2Fde%2Fff92deb592080c5d113f3c589ad6ae5e.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653726893&t=ef211f5b2611f8e1d3b4c191b569105a')
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: new Text('个人'),
            subtitle: new Text('个人详情'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: new Text('个人'),
            subtitle: new Text('个人详情'),
          )
        ],
      ),
    );
  }
}