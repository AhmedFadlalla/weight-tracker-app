import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/core/utils/enum.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';

import '../../../core/utils/constrant.dart';
import '../../../domain/use_case/get_user_data_use_case.dart';
import '../../../domain/use_case/get_weights_data_use_case.dart';
import '../../../domain/use_case/send_weight_data_use_case.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, BaseHomeState> {
  final GetUserDataUseCase getUserDataUseCase;
  final SendWeightDataUseCase sendWeightDataUseCase;
  final GetWeightDataUseCase getWeightsDataUseCase;
  HomeBloc(this.getUserDataUseCase,this.sendWeightDataUseCase,this.getWeightsDataUseCase) : super(const BaseHomeState()) {
    on<GetUserDataEvent>((event, emit) async{
      final result=await getUserDataUseCase(event.uId);
      result.fold((l) => emit(
        state.copyWith(
          userDataState: RequestState.error,
          userDataMessage: l.message
        )
      ), (r) => emit(
        state.copyWith(
          userData: r,
          userDataState: RequestState.loaded
        )
      ));
    });
    on<SendWeightDataEvent>((event, emit) async{

      final result=await sendWeightDataUseCase(
          WeightParameter(weight: event.weight, dateTime: event.dateTime));
      result.fold((l) => emit(
          state.copyWith(
              sendWeightDataState: RequestState.error,
              sendWeightDataMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(

              sendWeightDataState: RequestState.loaded
          )
      ));

    });
    on<GetWeightsDataEvent>((event, emit) async{

      final result=await getWeightsDataUseCase(const NoParameters());
      result.fold((l) => emit(
          state.copyWith(
              weightDataState: RequestState.error,
              weightDataMessage: l.message
          )
      ), (r) => emit(
          state.copyWith(
              weightData: r,
              weightDataState: RequestState.loaded
          )
      ));
    } );
  }
}
