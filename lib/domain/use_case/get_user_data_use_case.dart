import 'package:dartz/dartz.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/domain/entities/base_user.dart';

import '../repo/base_app_repo.dart';

class GetUserDataUseCase extends BaseUseCase<BaseUser,String>{
  final BaseAppRepository baseAppRepository;

  GetUserDataUseCase(this.baseAppRepository);

  @override
  Future<Either<FirebaseException, BaseUser>> call(String parameter) async{
    return await baseAppRepository.getUserData(parameter);
  }

}