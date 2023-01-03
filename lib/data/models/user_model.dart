import 'package:weight_tracker/domain/entities/base_user.dart';

class UserModel extends BaseUser{
  const UserModel({required super.name,required super.uId});


  factory UserModel.fromJson(Map<String,dynamic>json)
  =>UserModel(name: json["name"],uId: json["uId"]);


  Map<String,dynamic> toMap()=>{
    "name":name,
    "uId":uId
  };
}