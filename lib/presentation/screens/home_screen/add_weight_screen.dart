import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/utils/enum.dart';
import 'package:weight_tracker/presentation/controller/home/home_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weight_tracker/presentation/controller/home/home_event.dart';
import 'package:weight_tracker/presentation/controller/home/home_state.dart';

import '../../../core/services/service_locator.dart';
import '../component/compenent.dart';
class AddWeightScreen extends StatelessWidget {
   AddWeightScreen({Key? key}) : super(key: key);
var weightController=TextEditingController();
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,BaseHomeState>(
        builder: (context,state){
      return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title:const Text("Add Weight"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultFormField(
                    controller: weightController,
                    type: TextInputType.number,
                    label: "Enter Your Weight in KG",
                    validator: (value){
                      if(value.isEmpty){
                        return "Weight Must Not be Empty";
                      }
                      return null;
                    }),
                defaultButton(function: (){

                  sl<HomeBloc>().add(SendWeightDataEvent(
                      weight: double.parse(weightController.text),
                      dateTime:Timestamp.fromDate( DateTime.now()) ));
                }, text: "Add Weight")
              ],
            ),
          ),
        );
      },);
    }, listener:(context,state){
          if(state.sendWeightDataState==RequestState.loaded) {
            showToast(text: "Data Added Successfully", state: ToastStates.SUCCESS);
          }
    } );
  }
}
