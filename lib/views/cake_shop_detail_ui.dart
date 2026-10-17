// ignore_for_file: unused_import, must_be_immutable, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  // สร้างตัวแปรรับข้อมูลร้านเค้กที่ส่งมาจากหน้าแรก
  CakeShop? cakeShopDetail;

  CakeShopDetailUi({super.key, this.cakeShopDetail});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  //โทรออก (AI)
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.trim(),
    );
    await launchUrl(launchUri);
  }

  //เปิดเว็บไซต์,Facebook (AI)
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  //มีการใช้ widget ดึงข้อมูล(ชื่อ,เบอร์,ที่อยู่ และอื่นๆ)จากกล่องข้อมูล(cakeshopdetail)มา,!=ยืนยันว่ามีข้อมูลแน่ๆ
  //ตัวอย่างโครงสร้าง:widget.cakeShopDetail!.name!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ AppBar ด้านบน
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
        //ชื่อร้านที่กดเลือกมา (AI)
        title: Text(
          widget.cakeShopDetail!.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      //ส่วนของ Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                //รูปภาพทั้ง3ภาพ
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.cakeShopDetail!.image1!,
                    width: 130.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.cakeShopDetail!.image2!,
                        width: 130.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.cakeShopDetail!.image3!,
                        width: 130.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                //มีการใช้ widget ดึงข้อมูล(ชื่อ,เบอร์,ที่อยู่ และอื่นๆ)จากกล่องข้อมูล(cakeshopdetail)มา,!=ยืนยันว่ามีข้อมูลแน่ๆ
                //ตัวอย่างโครงสร้าง:widget.cakeShopDetail!.name!
                
                //ข้อมูลร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //ชื่อร้าน
                      Text(
                        'ชื่อร้าน 🏪',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.cakeShopDetail!.name!),
                      SizedBox(height: 12.0),

                      //เวลาเปิด-ปิด
                      Text(
                        'เวลาเปิดปิด ⏰',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.cakeShopDetail!.openCloseTime!),
                      SizedBox(height: 12.0),

                      //รายละเอียดร้าน
                      Text(
                        'รายละเอียดของร้าน 🍵',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.cakeShopDetail!.description!),
                      SizedBox(height: 12.0),

                      //ที่อยู่ร้าน
                      Text(
                        'ที่อยู่ของร้าน 🚩',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.cakeShopDetail!.address!),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),

                //ปุ่มกดโทรออกสีเขียว
                ElevatedButton.icon(
                  onPressed: () {
                    _makePhoneCall(widget.cakeShopDetail!.phone!);
                    //ฟังก์ชันสำหรับการโทรออก ที่เราสร้างไว้ด้านบนของไฟล์widget
                  },
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  label: Text(
                    widget.cakeShopDetail!.phone!,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  ),
                ),
                SizedBox(height: 10.0),

                //ลิงก์เว็บไซต์ของร้าน
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    _launchInBrowser(
                        Uri.parse(widget.cakeShopDetail!.website!));
                    //ฟังก์ชันสำหรับเว็บไซต์ร้านค้า ที่เราสร้างไว้ด้านบนของไฟล์widget
                  },
                  leading: Icon(
                    Icons.language,
                    color: Colors.amber[700],
                    size: 28.0,
                  ),
                  title: Text(
                    widget.cakeShopDetail!.website!,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  trailing: Icon(
                    Icons.link,
                    color: Colors.grey[700],
                  ),
                ),

                //ลิงก์Facebookของร้าน
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    _launchInBrowser(
                        Uri.parse(widget.cakeShopDetail!.facebook!));
                    //ฟังก์ชันสำหรับเว็บไซต์facebook ที่เราสร้างไว้ด้านบนของไฟล์widget
                  },
                  leading: Icon(
                    Icons.facebook, // Icons.facebook
                    color: Colors.blue[700],
                    size: 28.0,
                  ),
                  title: Text(
                    widget.cakeShopDetail!.facebook!,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  trailing: Icon(
                    Icons.link,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 15.0),

                //แผนที่ร้านค้า(ใช้FlutterMapคู่กับOpenStreetMap) (AI)
                SizedBox(
                  width: double.infinity,
                  height: 300.0,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShopDetail!.latitude!),
                        double.parse(widget.cakeShopDetail!.longitude!),
                      ),
                      initialZoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'com.example.flutter_cake_shop_project',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShopDetail!.latitude!),
                              double.parse(widget.cakeShopDetail!.longitude!),
                            ),
                            child: InkWell(
                              onTap: () {
                                // เมื่อกดที่หมุดสีแดงจะเปิดนำทางใน Google Maps
                                String googleMapsUrl =
                                    'https://www.google.com/maps/search/?api=1&query=${widget.cakeShopDetail!.latitude!},${widget.cakeShopDetail!.longitude!}';
                                _launchInBrowser(Uri.parse(googleMapsUrl));
                              },
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 45.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
