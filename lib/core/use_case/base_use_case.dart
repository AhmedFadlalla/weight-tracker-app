import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import '../error/failure.dart';
import '../utils/constrant.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<FirebaseException,T>> call(Parameters parameter,);
}
abstract class StreamUseCase<T,Parameters>{
  Stream<Either<FirebaseException,T>> call(Parameters parameter,);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
