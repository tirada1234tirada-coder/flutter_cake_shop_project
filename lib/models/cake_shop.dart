class CakeShop {
  //ตัวแปรที่ล้อกับรายละเอียดของข้อมูล
  String? name;
  String? address;
  String? phone;
  String? image1;
  String? image2;
  String? image3;
  String? openCloseTime;
  String? description;
  String? website;
  String? latitude;
  String? longitude;

  //
  CakeShop({
    this.name,
    this.address,
    this.phone,
    this.image1,
    this.image2,
    this.image3,
    this.description,
    this.openCloseTime,
    this.website,
    this.latitude,
    this.longitude, required String facebook,
  });
}