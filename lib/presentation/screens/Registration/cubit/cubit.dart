import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Models/signup_model.dart';
import 'package:la_vie/Models/signin_model.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/HomeScreen/home_screen.dart';
import 'package:la_vie/presentation/screens/Registration/cubit/states.dart';

import '../../../Components/navigation_bar.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(LoginInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);
  SignInModel signInModel = SignInModel();

  void userSignIn(
    context, {
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      endPoint: auth,
      method: 'signin',
      data: {
        "password": password,
        "email": email,
      },
    ).then((value) {
      signInModel = SignInModel.fromJson(value.data);
      print(signInModel.data!.accessToken!.toString());
      print(signInModel.data!.refreshToken!.toString());
      CashHelper.put(key: 'accessToken', value: signInModel.data!.accessToken!.toString());
      CashHelper.put(key: 'refreshToken', value: signInModel.data!.refreshToken!.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
      emit(LoginSuccessState());
    }).catchError(
      (error) {
        emit(LoginErrorState());
        print('error : ${error.toString()}');
      },
    );
  }
}

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  SignUpModel signUpModel = SignUpModel();

  void userSignUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      endPoint: auth,
      method: 'signup',
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password
      },
    ).then((value) {
      //print(value.data);
      signUpModel = SignUpModel.fromJson(value.data);
      print(signUpModel.user);
      print(signUpModel.type);
      emit(SignUpSuccessState());
    }).catchError(
      (error) {
        emit(SignUpErrorState());
        print('error : $error');
      },
    );
  }
}

//emails
/*
mmee@gmail.com    MmMm,,123456
mmee@gmail.com
MmMm,,123456


*/
