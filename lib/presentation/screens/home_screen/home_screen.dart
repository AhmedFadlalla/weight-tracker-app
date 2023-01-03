import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weight_tracker/domain/entities/base_weight_data.dart';
import 'package:weight_tracker/presentation/controller/home/home_event.dart';
import 'package:weight_tracker/presentation/controller/home/home_state.dart';
import 'package:weight_tracker/presentation/screens/component/compenent.dart';
import 'package:weight_tracker/presentation/screens/home_screen/sign_out_bottom_component.dart';
import 'package:weight_tracker/presentation/screens/home_screen/user_data_component.dart';
import 'package:weight_tracker/presentation/screens/home_screen/weight_data_component.dart';

import '../../../core/services/cach_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/constrant.dart';
import '../../../core/utils/enum.dart';
import '../../controller/home/home_bloc.dart';
import 'add_weight_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (uId != null) {
      uId = CachHelper.getData(key: "uId");
    }
    return BlocConsumer<HomeBloc, BaseHomeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
             return  Scaffold(
              appBar: AppBar(
                title: const Text("Home Screen"),
                actions: const [
                  SignOutBottomComponent()
                ],
              ),
              body: SingleChildScrollView(

                child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const UserDataComponent(),
                          SizedBox(height: 9.h,),
                          Text("Your Weight Record",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 15.sp,
                                color: Colors.grey.shade600
                            ),),
                          SizedBox(height: 9.h,),
                          WeightDataComponent(),
                        ],
                      ),
                    )),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    navigateTo(context, AddWeightScreen());
                  },
                  child: Icon(Icons.add)),
            );
          },
        );
      },
      listener: (context, state) {
        if(state.weightDataState==RequestState.loading) {
          sl<HomeBloc>().add(GetWeightsDataEvent());
        }
      },
    );
  }
}
