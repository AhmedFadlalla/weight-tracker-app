





import 'package:get_it/get_it.dart';
import 'package:weight_tracker/data/data_source/base_remote_data_source.dart';
import 'package:weight_tracker/domain/repo/base_app_repo.dart';
import 'package:weight_tracker/domain/use_case/get_user_data_use_case.dart';
import 'package:weight_tracker/domain/use_case/get_weights_data_use_case.dart';
import 'package:weight_tracker/domain/use_case/send_weight_data_use_case.dart';
import 'package:weight_tracker/domain/use_case/sign_in_use_case.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_bloc.dart';
import 'package:weight_tracker/presentation/controller/home/home_bloc.dart';

import '../../data/repo/app_repo.dart';
import '../../domain/use_case/sign_out_use_case.dart';

final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc

    sl.registerLazySingleton<AuthBloc>(() =>AuthBloc(sl(),sl()));
    sl.registerLazySingleton<HomeBloc>(() =>HomeBloc(sl(),sl(),sl()));

    //use case
    sl.registerLazySingleton<SignInUseCase>(() =>SignInUseCase(sl()) );
    sl.registerLazySingleton<SignOutUseCase>(() =>SignOutUseCase(sl()) );
    sl.registerLazySingleton<GetUserDataUseCase>(() =>GetUserDataUseCase(sl()) );
    sl.registerLazySingleton<SendWeightDataUseCase>(() =>SendWeightDataUseCase(sl()) );
    sl.registerLazySingleton<GetWeightDataUseCase>(() =>GetWeightDataUseCase(sl()) );

    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()) );
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() =>RemoteDataSource() );
  }

}