import 'Meals.dart';

/// message : "Done"
/// meals : [{"_id":"65e2368df6a8df7c5ab35f67","name":"halawa","description":"sugar","price":250,"howToSell":"number","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709323916/Meals/logo.pngi2Dv731tGXcZ4oTejHw8b/logo.png2TLaECFhU0RehnJuboEC7.png"],"category":"Fish","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-01T20:11:57.193Z","updatedAt":"2024-03-01T20:11:57.193Z","__v":0},{"_id":"65e26ba5002cd1940b5ff495","name":"Besella Masry","description":"Helwa","price":5000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709337509/Meals/b80180ed-9353-40c6-8b89-39b18050632b4951210563192305338.jpg686HcwFRdSGs16zTbv0jT/b80180ed-9353-40c6-8b89-39b18050632b4951210563192305338.jpgogifHDqu9OTqSh388Sy9K.jpg"],"category":"Beef","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-01T23:58:29.715Z","updatedAt":"2024-03-01T23:58:29.715Z","__v":0},{"_id":"65e26c4c002cd1940b5ff499","name":"Besella fagr","description":"Helwa","price":5000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709337675/Meals/b80180ed-9353-40c6-8b89-39b18050632b4951210563192305338.jpggJyF5KimhB0FzwTw_a_4r/b80180ed-9353-40c6-8b89-39b18050632b4951210563192305338.jpgjuI_E3A-b01LHEEqN8nFI.jpg"],"category":"Beef","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-02T00:01:16.496Z","updatedAt":"2024-03-02T00:01:16.496Z","__v":0},{"_id":"65e26ea7002cd1940b5ff4b3","name":"Ferakh","description":"Gamda","price":5888,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709338278/Meals/7d6b65b0-6655-4cb2-a626-3cf027fa06e07163452986649116464.jpg6HtVBJVtVI9Zc6tlBrwpa/7d6b65b0-6655-4cb2-a626-3cf027fa06e07163452986649116464.jpgz71iblgWXoJCZTQNPDUdk.jpg"],"category":"Beef","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-02T00:11:19.651Z","updatedAt":"2024-03-02T00:11:19.651Z","__v":0},{"_id":"65e26fbf002cd1940b5ff4b7","name":"fish","description":"ffff","price":1000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709338559/Meals/ce939985-5d9d-4af6-b139-661cbd5915ec4115584312368957116.jpgt9768mZh_aT5diqTZ0G-D/ce939985-5d9d-4af6-b139-661cbd5915ec4115584312368957116.jpgKQk08CYzwEuIoq353B_be.jpg"],"category":"Beef","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-02T00:16:00.148Z","updatedAt":"2024-03-02T00:16:00.148Z","__v":0},{"_id":"65e27031002cd1940b5ff4bb","name":"Bory","description":"yyyy","price":7000,"howToSell":"quantity","images":["https://res.cloudinary.com/dx2kspdex/image/upload/v1709338672/Meals/5ec51f4a-03a7-457b-add7-6718f8209926796242639687509351.jpg-RcsiHMUWqMQ1Jargt8ox/5ec51f4a-03a7-457b-add7-6718f8209926796242639687509351.jpgdhDCPIzIcGXO681i21NZH.jpg"],"category":"Beef","chefId":"65cfe70d29229d2c33045f00","status":"pending","createdAt":"2024-03-02T00:17:53.279Z","updatedAt":"2024-03-02T00:17:53.279Z","__v":0}]

class MealModel {
  MealModel({
      this.message, 
      this.meals,});

  MealModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(Meals.fromJson(v));
      });
    }
  }
  String? message;
  List<Meals>? meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}