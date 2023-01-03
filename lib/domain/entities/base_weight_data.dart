import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BaseWeightData extends Equatable{
  final double weight;
  final Timestamp dateTime;

  const BaseWeightData({required this.weight, required this.dateTime});

  @override
  List<Object?> get props => [weight,dateTime];

}