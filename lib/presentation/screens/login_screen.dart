import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weight_tracker/core/services/cach_helper.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_bloc.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_state.dart';
import 'package:weight_tracker/presentation/screens/home_screen/home_screen.dart';

import '../../core/services/service_locator.dart';
import '../controller/auth/auth_event.dart';
import 'component/compenent.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  var nameController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          return ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Sign In"),
                ),
                body: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            label: "Enter Your Name",
                            validator: (value) {
                              if(value.isEmpty){
                                return "Name Must Not be Empty";
                              }
                              return null;
                            }),
                        SizedBox(height: 50.h,),
                        defaultButton(function: (){
                          if(formKey.currentState!.validate()){
                            sl<AuthBloc>().add(SignInAnonymouslyEvent(name: nameController.text));
                          }
                        }, text: "Sign In Anonymously")
                      ],
                    ),
                  ),
                ),
              );
            },);
        },
        listener: (context, state) {
          if(state is SignInAnonymouslySuccessState){
            CachHelper.saveData(key: "uId", value: state.uId).then((value) {
              showToast(text: "Login Successfully", state: ToastStates.SUCCESS);
              navigateAndFinish(context, const HomeScreen());
            });
          }
        });
  }
}
