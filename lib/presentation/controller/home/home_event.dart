import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {

  const HomeEvent();

  @override
  List<Object> get props => [];
}
class GetUserDataEvent extends HomeEvent{
  final String uId;

  const GetUserDataEvent({required this.uId});
}
class SendWeightDataEvent extends HomeEvent{
  final double weight;
  final Timestamp dateTime;

  const SendWeightDataEvent({required this.weight,required this.dateTime});
}
class GetWeightsDataEvent extends HomeEvent{}