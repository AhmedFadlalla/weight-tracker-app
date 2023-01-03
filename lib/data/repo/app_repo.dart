import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/core/error/failure.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/data/data_source/base_remote_data_source.dart';
import 'package:weight_tracker/domain/entities/base_user.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';
import 'package:weight_tracker/domain/repo/base_app_repo.dart';

import '../../core/utils/constrant.dart';

class AppRepository extends BaseAppRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  AppRepository(this.baseRemoteDataSource);

  @override
  Future<Either<FirebaseException, String>> signInAnonymously(UserParameter parameter) async{
    final result=await baseRemoteDataSource.signInAnonymously(parameter);
    try{
      return Right(result);
    }on FirebaseException catch(e){
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException, BaseUser>> getUserData(String uId)async {
    final result=await baseRemoteDataSource.getUserData(uId);
    try{
      return Right(result);
    }on FirebaseException catch(e){
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException, void>> sendWeightData(WeightParameter parameter) async{
    await baseRemoteDataSource.sendWeightData(parameter);
    try{
      return Right(debugPrint("Added Successfully"));
    }on FirebaseException catch(e){
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException,Stream<List<BaseWeightData>>>> getWeightsData() async{
    final result= baseRemoteDataSource.getWeightsData();
    try{
      return Right(result!);
    }on FirebaseException catch(e){
      return Left(e);
    }
  }

  @override
  Future<Either<FirebaseException, void>> signOut(NoParameters parameters)async {
    await baseRemoteDataSource.signOut(parameters);
    try{
      return Right(print("Sign Out Successfully"));
    }on FirebaseException catch(e){
      return Left(e);
    }
  }

}