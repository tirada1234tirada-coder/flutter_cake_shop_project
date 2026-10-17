// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CakeShopDetailUi extends StatefulWidget {
  const CakeShopDetailUi({super.key});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ appBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Larna House',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      //ส่วนของ Body
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: AlignmentGeometry.centerLeft,
                child: OutlinedButton(
                  onPressed: () {
                    //ย้อนกลับไปหน้าก่อนหน้า
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_sharp, size: 20.0),
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(75.0, 65.0),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
