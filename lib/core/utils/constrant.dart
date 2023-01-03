

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserParameter extends Equatable{
   final String name ;
  const UserParameter({
     required this.name,
  });
  @override

  List<Object?> get props => [name];

}
class WeightParameter extends Equatable{
  final double weight ;
  final Timestamp dateTime;
  const WeightParameter({
    required this.weight,
    required this.dateTime
  });
  @override

  List<Object?> get props => [weight,dateTime];

}
String? uId;
