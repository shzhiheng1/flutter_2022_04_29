
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'package:flutter_swiper/flutter_swiper.dart';//轮播插件


import './left_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
  }
  List images=[
    {
      'id':'1',
      'src':'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2Fv2-4f08f6e64e4b7a08029ff25803c7d5ad_r.jpg%3Fsource%3D1940ef5c&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656147149&t=4b2d86428cd2e6e2df7875e0e80d4a6e'
    },
    {
      'id':'2',
      'src':'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F101021113337%2F211010113337-2-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656147398&t=bd50b0f8260ef132c1e91867d735ea5e'
    },
    {
      'id':'3',
      'src':'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F092221102018%2F210922102018-8-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1656148898&t=8d7da5b02f4fb64249d2e7a3661c3970'
    }
  ];

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
      body:ListView(
          children: [
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(300),
              color: Colors.amber[50],
              child: Swiper(
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          images[index]['src'],
                          width: ScreenUtil().setWidth(750),
                          height: ScreenUtil().setHeight(300),
                          fit: BoxFit.fill
                        )
                      ]
                    ),
                  );
                },
                autoplay: true,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                pagination:const  SwiperPagination(alignment: Alignment.bottomCenter),
                //control: const SwiperControl(),//控制左右按钮
                onTap:(index){
                  debugPrint('点击轮播图下标为：$index');
                }
              ),
            )
          ],
      )
      );
  }

@override
void dispose() {
  super.dispose();
}

}

