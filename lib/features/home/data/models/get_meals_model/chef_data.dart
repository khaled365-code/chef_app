/// _id : "653aa89d6fa960fe1ac59208"
/// name : "Ammar"
/// phone : "01021570316"
/// brandName : "Ammar Chef"

class ChefData {
  ChefData({
      this.id, 
      this.name, 
      this.phone, 
      this.brandName,});

  ChefData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    brandName = json['brandName'];
  }
  String? id;
  String? name;
  String? phone;
  String? brandName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['brandName'] = brandName;
    return map;
  }

}