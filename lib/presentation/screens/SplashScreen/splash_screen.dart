import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/HomeScreen/home_screen.dart';
import 'package:la_vie/presentation/screens/Registration/loginScreen.dart';
import 'package:la_vie/presentation/screens/Registration/registrationScreen.dart';

import '../../Components/navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const RegistrationScreen()))
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/la_vie_logo.png',
          height: 81,
          width: 408,
        ),
      ),
    );
  }
}
/*return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) => () {},
        builder: (context, state) => ,
      ),
    );*/