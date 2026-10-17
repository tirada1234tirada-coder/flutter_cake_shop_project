// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState(){
    Future.delayed(
      //เวลาหน่วง
      Duration(seconds: 3,),
      //พบเวลาหย่วงแล้วจะให้ทำอะไร
      (){
        //เปิดหน้าจอแบบย้อนกลับไม่ได้
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CakeShopListUi()
          ),
        );
      }
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ชั้นที่ 1 แสดงรูป
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_welcome.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ชั้นที่ 2 แสดงชื่อแอป และโปรเกรสหมุนๆ ^_^
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  'สายด่วนกินเค้ก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CAKE CALL FAST',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: const Color.fromARGB(255, 250, 143, 135),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CircularProgressIndicator(
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
 