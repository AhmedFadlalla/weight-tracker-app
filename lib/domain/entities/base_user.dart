import 'package:equatable/equatable.dart';

class BaseUser extends Equatable{
  final String name;
  final String uId;

  const BaseUser({required this.name,required this.uId});

  @override
  List<Object?> get props => [name];

}