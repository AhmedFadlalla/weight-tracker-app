import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/core/utils/constrant.dart';

import '../../../domain/use_case/sign_in_use_case.dart';
import '../../../domain/use_case/sign_out_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  AuthBloc(this.signInUseCase,this.signOutUseCase) : super(AuthLoadingState()) {
    on<SignInAnonymouslyEvent>((event, emit) async{
      emit(SignInAnonymouslyLoadingState());
      await signInUseCase(UserParameter(name: event.name)).then((value) {
        emit(SignInAnonymouslySuccessState(uId: value.fold((l) => "", (r) => r)));
      }).catchError((error){
        emit(SignInAnonymouslyErrorState(error: error.toString()));
      });
      
    });
    on<SignOutEvent>((event, emit) async{
      emit(SignOutLoadingState());
      await signOutUseCase(const NoParameters()).then((value) {
        emit(SignOutSuccessState());
      }).catchError((error){
        emit(SignOutErrorState(error:error.toString()));
      });

    });
  }
}
