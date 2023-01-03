import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/failure.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/domain/repo/base_app_repo.dart';

class SignOutUseCase extends BaseUseCase<void , NoParameters>{
  final BaseAppRepository  baseAppRepository;

  SignOutUseCase(this.baseAppRepository);

  @override
  Future<Either<FirebaseException, void>> call(NoParameters parameter) async{
   return await baseAppRepository.signOut(parameter);
  }

}