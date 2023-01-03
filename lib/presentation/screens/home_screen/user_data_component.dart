import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/presentation/controller/home/home_bloc.dart';
import 'package:weight_tracker/presentation/controller/home/home_state.dart';

import '../../../core/utils/enum.dart';
class UserDataComponent extends StatelessWidget {
  const UserDataComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,BaseHomeState>(builder: (context,state){
     switch(state.userDataState){
       case RequestState.loading:
         return const Center(child: CircularProgressIndicator(),);
       case RequestState.loaded:
         return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
           return Text("Welcome , ${state.userData!.name??""}",
             style: Theme.of(context).textTheme.headline1!.copyWith(
                 fontSize: 20.sp
             ),);
         },);
       case RequestState.error:
         return Center(child: Text(state.userDataMessage));
     }
    }, listener: (context,state){});
  }
}
