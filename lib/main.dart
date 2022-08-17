import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/Registration/loginScreen.dart';
import 'package:la_vie/presentation/screens/SplashScreen/splash_screen.dart';

import 'Shared/Cubit/cubit.dart';
import 'Shared/Cubit/cubit_observer.dart';
import 'Shared/Cubit/states.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) => () {},
        builder: (context, state) => MaterialApp(
          title: 'La Vie',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromRGBO(26, 188, 0, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
    /*return MaterialApp(
      title: 'La Vie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromRGBO(26, 188, 0, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
    );*/
  }
}
