import 'chef_data.dart';

/// _id : "65de3dbe012b561fc7e8edb8"
/// name : "TEst Meal"
/// description : "Test Meal Meal Mealafdsfasdgfsd"
/// price : 125
/// howToSell : "quantity"
/// images : ["https://res.cloudinary.com/dx2kspdex/image/upload/v1709063613/Meals/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgGJrAU8l1eJMw_NBNvT1OO/scaled_4f08695f-5083-4f19-8a51-d954fa9aed374182861994691810582.jpgT6DLJrnbbSeHtzCXwCEEb.jpg"]
/// category : "Beef"
/// chefId : {"_id":"653aa89d6fa960fe1ac59208","name":"Ammar","phone":"01021570316","brandName":"Ammar Chef"}
/// status : "accepted"
/// createdAt : "2024-02-27T19:53:34.363Z"
/// updatedAt : "2024-02-27T20:08:29.928Z"
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

  Meals.fromJson( json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    howToSell = json['howToSell'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    category = json['category'];
    chefId = json['chefId'] != null ? ChefData.fromJson(json['chefId']) : null;
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
  ChefData? chefId;
  String? status;
  String? createdAt;
  String? updatedAt;
  num? v;
  bool itemIsSelected=false;



  toJson(Meals meal)
  {
    final map = <String, dynamic>{};
    map['_id'] = meal.id;
    map['name'] = meal.name;
    map['description'] = meal.description;
    map['price'] = meal.price;
    map['howToSell'] = meal.howToSell;
    map['images'] = meal.images;
    map['category'] = meal.category;
    if (chefId != null) {
      map['chefId'] = meal.chefId?.toJson();
    }
    map['status'] = meal.status;
    map['createdAt'] = meal.createdAt;
    map['updatedAt'] = meal.updatedAt;
    map['__v'] = meal.v;
    return map;
  }

}