import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/presentation/Components/navigation_bar.dart';
import 'package:la_vie/presentation/screens/Registration/registrationBackground.dart';
import 'package:la_vie/presentation/screens/Registration/sign_up.dart';
import 'package:la_vie/presentation/screens/Registration/signin_with%20google.dart';
import '../../../Shared/Cubit/cubit.dart';
import '../../../Shared/Cubit/states.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) => () {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: RegistrationBackground(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const Spacer(),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      child: Image.asset(
                        'assets/images/Logo.png',
                      ),
                    ),
                    const Spacer(),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      unselectedLabelColor:
                          const Color.fromRGBO(138, 138, 138, 1),
                      unselectedLabelStyle: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      indicatorPadding: const EdgeInsets.only(top: 16.0),
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: const [
                        Text(
                          "Sign up",
                        ),
                        Text(
                          "Login",
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 8,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        viewportFraction: 1,
                        children: [
                          SignUpScreen(),
                          LoginScreen(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
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
                          ),
                        ),
                      ],
                    ),
                    // const Spacer(),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Image.asset('assets/images/Google.png'),
                          onPressed: () {
                            print("google");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInWithGoogle()));
                          },
                        ),
                        TextButton(
                          child: Image.asset('assets/images/Facebook.png'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomBar()));
                            print("Facebook");
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
