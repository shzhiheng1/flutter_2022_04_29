
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'package:flutter_easyrefresh/easy_refresh.dart';//下拉刷新，上拉加载

class FindPage extends StatefulWidget {
 const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
   late EasyRefreshController _controller;
   // 条目总数
  int _count = 10;

  @override
  void initState(){
    super.initState();
    _controller=EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          '发现',
          style: TextStyle(color: Colors.white),
          ),
        centerTitle: true,
      ),
      body: EasyRefresh.custom(
          enableControlFinishRefresh: false,
          enableControlFinishLoad: true,
          controller: _controller,
          header: ClassicalHeader(
            refreshReadyText:'释放刷新',
            refreshText:'下拉刷新',
            refreshingText:'正在刷新中...',
            refreshedText:'刷新完成',
            refreshFailedText:'刷新失败',
            showInfo: false,
            bgColor:const Color.fromRGBO(255, 248, 225, 1),
            textColor:const Color.fromRGBO(237, 211, 13, 1)
          ),
          footer: ClassicalFooter(),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2), () {
              print('onRefresh');
              setState(() {
                _count = 10;
              });
              _controller.resetLoadState();
            });
          },
          onLoad: () async {
            await Future.delayed(const Duration(seconds: 2), () {
              print('onLoad');
              setState(() {
                _count += 10;
              });
              _controller.finishLoad(noMore: _count >= 40);
            });
          },
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return 
                      Card(
                        color: Colors.amber[200],
                        child:Padding(
                          padding:const EdgeInsets.all(20),
                          child:Row(children: [
                            Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F092221102018%2F210922102018-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1655977700&t=6c0c045e9bb2c8acab4cf544e4b2de0e',
                                width: ScreenUtil().setWidth(160),
                                height: ScreenUtil().setHeight(160),
                                fit: BoxFit.fill,
                            ) ,
                            SizedBox(width: 20,height:ScreenUtil().setHeight(160)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('美女'),
                                  Text('中国航空学院'),
                              ],
                            )
                          ],)
                        ),

                        // Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F092221102018%2F210922102018-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1655977700&t=6c0c045e9bb2c8acab4cf544e4b2de0e') ,
                      );
                },
                childCount: _count,
              ),
            ),
          ],
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}