import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}
class AuthLoadingState extends AuthState{}
class SignInAnonymouslyLoadingState extends AuthState{}
class SignInAnonymouslySuccessState extends AuthState{
  final String uId;
 const  SignInAnonymouslySuccessState({required this.uId});
}
class SignInAnonymouslyErrorState extends AuthState{
  final String error;

  const SignInAnonymouslyErrorState({required this.error});
}
class SignOutLoadingState extends AuthState{}
class SignOutSuccessState extends AuthState{

}
class SignOutErrorState extends AuthState{
  final String error;

  const SignOutErrorState({required this.error});
}


