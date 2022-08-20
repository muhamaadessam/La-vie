import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/presentation/screens/Registration/cubit/cubit.dart';
import 'package:la_vie/presentation/screens/Registration/cubit/states.dart';
import 'components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) => () {},
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
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
                      title: 'Email',
                      keyboardType: TextInputType.emailAddress,
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
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      validation: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                SignInCubit.get(context).userSignIn(context,
                                    email: emailController!.text,
                                    password: passwordController!.text);
                              }
                              /* "email": "me1573@gmail.com",
                                 "password": "MmEe@15920"*/
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              height: 48,
                              //conditionalbuilder
                              child: Center(
                                child: Text(
                                  'Login',
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
