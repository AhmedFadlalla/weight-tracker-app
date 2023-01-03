import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weight_tracker/presentation/controller/home/home_bloc.dart';
import 'package:weight_tracker/presentation/controller/home/home_state.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/enum.dart';
class WeightDataComponent extends StatelessWidget {
  const WeightDataComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,BaseHomeState>(builder: (context,state){
      switch(state.weightDataState){
        case RequestState.loading:
          return const   Center(child: CircularProgressIndicator(),);
        case RequestState.loaded:
          return  ScreenUtilInit(builder: (BuildContext context, Widget? child) {
            return StreamBuilder(
                stream: state.weightData,
                builder: (context,snapShot){
                  if(snapShot.hasData){
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${snapShot.data![index].weight}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1,
                                  ),
                                ),
                                Text("${snapShot.data![index].dateTime.toDate()}")
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemCount: snapShot.data!.length);
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }

                });
          },);
        case RequestState.error:
          return Scaffold(
            body: Center(child: Text(state.weightDataMessage),),
          );
      }
    }, listener: (context,state){

    });
  }
}
