import 'package:dartz/dartz.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:weight_tracker/core/use_case/base_use_case.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';

import '../repo/base_app_repo.dart';

class GetWeightDataUseCase extends BaseUseCase<Stream<List<BaseWeightData>>,NoParameters>{
  final BaseAppRepository baseAppRepository;

  GetWeightDataUseCase(this.baseAppRepository);

  @override
  Future<Either<FirebaseException,Stream<List<BaseWeightData>>>> call(NoParameters parameter)async{
   return await baseAppRepository.getWeightsData();
  }

}