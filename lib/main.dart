import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/SplashScreen/splash_screen.dart';

import 'Shared/Cubit/cubit.dart';
import 'Shared/Cubit/cubit_observer.dart';
import 'Shared/Cubit/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SeedsCubit()..getSeedsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignInCubit()..signInModel.data!.accessToken,
        ),
        BlocProvider(
          create: (BuildContext context) => ToolsCubit()..getToolsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProductsCubit()..getProductsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => PlantsCubit()..getPlantsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => UserCubit()..getUserData(method: 'me'),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ForumsCubit()..getForumsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => MyForumsCubit()..getMyForumsData(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeTapsCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) => () {},
        builder: (context, state) {
          return MaterialApp(
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
          );
        },
      ),
    );
  }
}
