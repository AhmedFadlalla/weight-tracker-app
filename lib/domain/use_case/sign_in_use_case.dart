import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/failure.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/domain/repo/base_app_repo.dart';

import '../../core/utils/constrant.dart';

class SignInUseCase extends BaseUseCase<String , UserParameter >{
  final BaseAppRepository  baseAppRepository;

  SignInUseCase(this.baseAppRepository);

  @override
  Future<Either<FirebaseException, String>> call(UserParameter  parameter) async{
    return await baseAppRepository.signInAnonymously(parameter);
  }

}