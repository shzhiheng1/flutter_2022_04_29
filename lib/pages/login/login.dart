import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key ? key, required this.title }) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //  int _counter = 0;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>(); 

// 初始化
  @override
  void initState() {
    super.initState();
  }

// 编译
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
       appBar: AppBar(
         title:Text(widget.title),
         centerTitle: true,
       ),
       body: Container(
         color:Colors.amber[50],
         child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200.0,
                // color: Colors.white,
                child: Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage:NetworkImage('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fff%2F92%2Fde%2Fff92deb592080c5d113f3c589ad6ae5e.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653726893&t=ef211f5b2611f8e1d3b4c191b569105a')
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical:0.0,horizontal:30.0),
                child:Scrollbar(
                  child: SingleChildScrollView(
                      child:formChild(),
                  )
                )
              )
            ],
         ),
       ),
    );
  }


// 登录方法
Future <void> submitLogin(){
      debugPrint(_controllerName.text);
      debugPrint(_controllerPwd.text);
     return Fluttertoast.showToast(
          msg: '恭喜您，登录成功了！',
          fontSize: 18.0,
          timeInSecForIosWeb: 5,
          // toastLength:Toast.LENGTH_SHORT,
          backgroundColor: Colors.green,
          // webPosition:'center'
      );
}
// 表单
  Widget formChild(){
   return 
     Form(
       key: _formKey, //设置globalKey，用于后面获取FormState
        child: 
          Column(
            children:<Widget>[
                  TextField(
                      autofocus:true,
                      controller: _controllerName,
                      style:const TextStyle(fontSize: 18.0),
                      decoration:const InputDecoration(
                        // labelText: '用户名',
                        hintText:'用户名或邮箱',
                        prefixIcon: Icon(Icons.person)
                      )
                    ),
                   const SizedBox(height: 20.0),
                   TextField(
                      obscureText: true,
                      controller: _controllerPwd,
                      style:const  TextStyle(fontSize: 18.0),
                      decoration: const InputDecoration(
                        // labelText: '用户名',
                        hintText:'密码',
                        prefixIcon: Icon(Icons.lock)
                      )
                    ),
                   const SizedBox(height: 30.0),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:<Widget>[
                        TextButton(
                          child: const Text("用户注册"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                   SizedBox(
                     height: 50.0,
                     width: double.infinity,
                      child: ElevatedButton(
                        onPressed: submitLogin,
                        child:const Text(
                            '登录',
                            style: TextStyle(fontSize: 18.0,color: Colors.white)
                        ) ,
                    )
                   ),
                    // MaterialButton(
                    //     minWidth: MediaQuery.of(context).size.width,
                    //     height: 50.0,
                    //     color: Colors.amber,
                    //     textColor:Colors.white,
                    //     child:const Text('登录',style: TextStyle(fontSize: 18.0),),
                    //     onPressed: (){},
                    //   )
                  ]
                )
          );
  }

// 销毁
  @override
  void dispose() {
    super.dispose();
   
  }
}