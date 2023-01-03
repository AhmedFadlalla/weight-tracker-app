import 'package:dartz/dartz.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/domain/repo/base_app_repo.dart';

import '../../core/utils/constrant.dart';

class SendWeightDataUseCase extends BaseUseCase<void ,WeightParameter>{
  final BaseAppRepository baseAppRepository;

  SendWeightDataUseCase(this.baseAppRepository);

  @override
  Future<Either<FirebaseException, void>> call(WeightParameter parameter) async{
    return await baseAppRepository.sendWeightData(parameter);
  }

}