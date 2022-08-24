import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'package:la_vie/presentation/screens/Exam/qustion_screen.dart';
import 'package:la_vie/presentation/screens/Profile/background_profile.dart';
import 'package:la_vie/presentation/screens/Profile/components.dart';

import '../../../Shared/Constant/colors.dart';
import '../Registration/registrationScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit user = UserCubit.get(context);
    var formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) => () {},
      builder: (context, state) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: state is UserLoadingState || user.userModel == null
            ? const Center(child: CircularProgressIndicator())
            : BackgroundProfile(
                children: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 96,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            user.userModel!.data!.imageUrl.toString()),
                        radius: 75,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '${user.userModel!.data!.firstName} ${user.userModel!.data!.lastName}',
                        style: textStyle(
                            size: 25,
                            weight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .61,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(243, 254, 241, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height: 64,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Image.asset(
                                        '${imageAsset}points.png',
                                        height: 36,
                                      ),
                                    ),
                                    Text(
                                      user.userModel!.data!.userPoints == null
                                          ? 'You don\'t have points'
                                          : 'You have ${user.userModel!.data!.userPoints} points',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Edit Profile',
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              customCardForProfile(
                                  text: 'Name',
                                  onTap: () {
                                    changeNameAlertDialog(
                                      context,
                                      title: 'Name',
                                      formKey: formKey,
                                      loading: state is UserLoadingState,
                                      email: user.userModel!.data!.email,
                                      address: user.userModel!.data!.address,
                                      user: user,
                                      nameController: nameController,
                                    );
                                  }),
                              const SizedBox(
                                height: 32,
                              ),
                              customCardForProfile(
                                  text: 'Email',
                                  onTap: () {
                                    changeEmailAlertDialog(
                                      context,
                                      title: 'Email',
                                      formKey: formKey,
                                      loading: state is UserLoadingState,
                                      emailController: emailController,
                                      address: user.userModel!.data!.address,
                                      user: user,
                                      lastName: user.userModel!.data!.lastName,
                                      firstName: user.userModel!.data!.lastName,
                                    );
                                  }),
                              /*const SizedBox(
                                height: 64,
                              ),*/
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                          ),
                                          title: Text(
                                            'LogOut',
                                            style: textStyle(
                                              color: primaryColor,
                                              size: 20,
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                          content: Text(
                                            'Do you want to Log out the app',
                                            style: textStyle(color: Colors.black, size: 16),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'NO',
                                                style: textStyle(color: Colors.white, size: 16),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                CashHelper.put(key: 'Login', value: false);
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                    const RegistrationScreen(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'YES',
                                                style: textStyle(color: Colors.white, size: 16),
                                              ),
                                            ),
                                          ],
                                        );
                                      });

                                },
                                child: Text(
                                  'Log Out',
                                  style: textStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
