import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/failure.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/core/utils/constrant.dart';
import 'package:weight_tracker/domain/entities/base_user.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';

abstract class  BaseAppRepository{

  Future<Either<FirebaseException,String>>  signInAnonymously(UserParameter parameter);
  Future<Either<FirebaseException,void>>  signOut(NoParameters parameters);
  Future<Either<FirebaseException,BaseUser>>  getUserData(String uId);
  Future<Either<FirebaseException,void>>  sendWeightData(WeightParameter parameter);
  Future<Either<FirebaseException,Stream<List<BaseWeightData>>>>  getWeightsData();

}