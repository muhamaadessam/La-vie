import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/HomeScreen/home_screen.dart';

import 'components.dart';
import 'loginBackground.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LoginBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                Image.asset(
                  'assets/images/la_vie_logo.png',
                ),
                const SizedBox(
                  height: 64,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign up",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(138, 138, 138, 1)),
                    ),
                    const SizedBox(
                      width: 96,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(26, 188, 0, 1)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                CustomTextFormField(
                    title: 'Email',
                    isPassword: false,
                    controller: emailController),
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormField(
                    title: 'Password',
                    isPassword: true,
                    controller: passwordController),
                const SizedBox(
                  height: 64,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(26, 188, 0, 1),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                   /* DioHelper.getData(
                        url: '/api/v1/seeds',
                        query: {'type': 'GARDENIA PLANT'}).then((value) {
                      print(value.data.toString());
                    }).catchError((onError) {
                      print(onError.toString());
                    });*/
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        'Login',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Divider(
                      thickness: 1,
                      indent: 8,
                      endIndent: 8,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    )),
                    Text(
                      'or continue with',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(151, 151, 151, 1),
                      ),
                    ),
                    const Expanded(
                        child: Divider(
                      indent: 8,
                      endIndent: 8,
                      thickness: 1,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Image.asset('assets/images/Google.png'),
                      onPressed: () {
                        print("google");
                      },
                    ),
                    TextButton(
                      child: Image.asset('assets/images/Facebook.png'),
                      onPressed: () {
                        print("Facebook");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
