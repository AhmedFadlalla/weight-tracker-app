import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weight_tracker/core/services/cach_helper.dart';
import 'package:weight_tracker/core/services/service_locator.dart';
import 'package:weight_tracker/presentation/controller/auth/auth_bloc.dart';
import 'package:weight_tracker/presentation/controller/home/home_bloc.dart';
import 'package:weight_tracker/presentation/controller/home/home_event.dart';
import 'package:weight_tracker/presentation/screens/home_screen/home_screen.dart';
import 'package:weight_tracker/presentation/screens/login_screen.dart';

import 'bloc_observer.dart';
import 'core/utils/constrant.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  CachHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  uId = CachHelper.getData(key: "uId");
  Widget? widget;
  if (uId != null) {
    widget = const HomeScreen();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (uId != null) {
      uId = CachHelper.getData(key: "uId");
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<HomeBloc>()
              ..add(GetUserDataEvent(uId: uId!))
              ..add(GetWeightsDataEvent())),
        BlocProvider(
            create: (context) => sl<AuthBloc>()),

      ],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: GoogleFonts.poppins(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
                  .fontFamily,
              textTheme: TextTheme(
                  headline1: TextStyle(color: Colors.black, fontSize: 30.sp),
                  caption: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  bodyText1: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      height: 25.h)),
            ),
            home: startWidget,
          );
        },
      ),
    );
  }
}
