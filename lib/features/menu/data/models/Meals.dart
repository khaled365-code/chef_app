/// _id : "65e2368df6a8df7c5ab35f67"
/// name : "halawa"
/// description : "sugar"
/// price : 250
/// howToSell : "number"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1709323916/Meals/logo.pngi2Dv731tGXcZ4oTejHw8b/logo.png2TLaECFhU0RehnJuboEC7.png"]
/// category : "Fish"
/// chefId : "65cfe70d29229d2c33045f00"
/// status : "pending"
/// createdAt : "2024-03-01T20:11:57.193Z"
/// updatedAt : "2024-03-01T20:11:57.193Z"
/// __v : 0

class Meals {
  Meals({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.howToSell, 
      this.images, 
      this.category, 
      this.chefId, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Meals.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    chefId = json['chefId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? description;
  num? price;
  String? howToSell;
  List<String>? images;
  String? category;
  String? chefId;
  String? status;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['howToSell'] = howToSell;
    map['images'] = images;
    map['category'] = category;
    map['chefId'] = chefId;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}