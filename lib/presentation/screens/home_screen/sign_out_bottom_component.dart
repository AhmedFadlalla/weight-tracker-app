import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/services/cach_helper.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_event.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_state.dart';
import 'package:weight_tracker/presentation/screens/component/compenent.dart';

import '../../../core/services/service_locator.dart';
import '../../controller/auth/auth_bloc.dart';
import '../login_screen.dart';
class SignOutBottomComponent extends StatelessWidget {
  const SignOutBottomComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthState>(builder: (context,state){
      return IconButton(onPressed: (){
        sl<AuthBloc>().add(SignOutEvent());
      }, icon:const  Icon(Icons.logout));
    }, listener: (context,state){
      if(state is SignOutSuccessState)
      {
        CachHelper.removeData(key: "uId").then((value) {
          navigateAndFinish(context, LoginScreen());
        });
      }
    });
  }
}
