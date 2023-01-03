
import 'package:equatable/equatable.dart';
import 'package:weight_tracker/domain/entities/base_user.dart';

import '../../../core/utils/enum.dart';
import '../../../domain/entities/base_weight_data.dart';



class BaseHomeState extends Equatable{
  final   BaseUser? userData;
  final RequestState userDataState;
  final String userDataMessage;
  final RequestState sendWeightDataState;
  final String sendWeightDataMessage;
  final   Stream<List<BaseWeightData>>? weightData;
  final RequestState weightDataState;
  final String weightDataMessage;


 const  BaseHomeState(
      {this.userData,
      this.userDataState=RequestState.loading,
      this.userDataMessage='',
      this.sendWeightDataState=RequestState.loading,
      this.sendWeightDataMessage='',
      this.weightData,
      this.weightDataState=RequestState.loading,
      this.weightDataMessage=''});


  BaseHomeState copyWith({
       BaseUser? userData,
     RequestState? userDataState,
     String? userDataMessage,
     RequestState? sendWeightDataState,
     String? sendWeightDataMessage,
       Stream<List<BaseWeightData>>? weightData,
     RequestState? weightDataState,
     String? weightDataMessage,
})=> BaseHomeState(
    userData: userData??this.userData,
    userDataState: userDataState??this.userDataState,
    userDataMessage: userDataMessage??this.userDataMessage,
    weightData: weightData??this.weightData,
    weightDataMessage: weightDataMessage??this.weightDataMessage,
    weightDataState: weightDataState??this.weightDataState,
    sendWeightDataState: sendWeightDataState??this.sendWeightDataState,
    sendWeightDataMessage: sendWeightDataMessage??this.sendWeightDataMessage
  );
  @override
  List<Object?> get props => [
    userData,userDataMessage,userDataState,
    sendWeightDataState,sendWeightDataMessage,
    weightData,weightDataMessage,weightDataState
  ];

}