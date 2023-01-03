import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';

class WeightModel extends BaseWeightData{
  const WeightModel({required super.weight, required super.dateTime});

  factory WeightModel.fromJson(Map<String,dynamic>json)
  =>WeightModel(dateTime:json["dateTime"] ,weight:json["weight"]);

  Map<String,dynamic> toMap()=>{
    "weight":weight,
    "dateTime":dateTime
  };

}