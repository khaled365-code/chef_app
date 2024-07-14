/// status : 400
/// ErrorMessage : "validationError"
/// Error : ["\"email\" must be a valid email"]

class NewErrorModel {
  NewErrorModel({
      this.status, 
      this.errorMessage, 
      this.error,});



  factory NewErrorModel.fromJson(dynamic json) {
    return NewErrorModel(
        status : json['status'],
        errorMessage : json['ErrorMessage'],
        error : json['Error'] != null ? json['Error'].cast<String>() :null,
    );

  }
  num? status;
  String? errorMessage;
  List<String>? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['ErrorMessage'] = errorMessage;
    map['Error'] = error;
    return map;
  }

}