import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/presentation/Components/navigation_bar.dart';
import 'package:la_vie/presentation/screens/Registration/cubit/states.dart';
import '../../../Shared/Cubit/cubit.dart';
import '../../../Shared/Cubit/states.dart';
import '../../../Shared/Network/Remote/dio_helper.dart';
import 'components.dart';
import 'cubit/cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController? emailController = TextEditingController();
  TextEditingController? firstNameController = TextEditingController();
  TextEditingController? lastNameController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) => () {},
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                      title: 'First Name',
                      isPassword: false,
                      controller: firstNameController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      title: 'Last Name',
                      isPassword: false,
                      controller: lastNameController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      title: 'E-mail',
                      isPassword: false,
                      controller: emailController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      title: 'Password',
                      isPassword: true,
                      controller: passwordController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      title: 'Confirm Password',
                      isPassword: true,
                      controller: confirmPasswordController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          SignUpCubit.get(context).userSignUp(
                              firstName: firstNameController!.text,
                              lastName: lastNameController!.text,
                              email: emailController!.text,
                              password: passwordController!.text);

                          /*Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const BottomBar(),
                                      ),
                                    );*/
                        }
                        /*DioHelper.postData(
                          endPoint: auth,
                          method: 'signup',
                          data: {
                            "email": emailController!.text,
                            "password": passwordController!.text,
                            "firstName": firstNameController!.text,
                            "lastName": lastNameController!.text,
                          },
                        ).then(
                          (value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomBar(),
                              ),
                            );
                            print(value.data);
                          },
                        ).catchError(
                          (onError) {
                            print("Error: ${onError.toString()}");
                            return;
                          },
                        );*/
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Center(
                          child: Text(
                            'Sign Up',
                          ),
                        ),
                      ),
                    ),
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
