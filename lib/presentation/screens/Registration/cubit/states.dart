import 'package:la_vie/Models/user.dart';

import '../../../../Models/signup_model.dart';

abstract class SignInStates {}

class LoginInitialState extends SignInStates {}

class LoginLoadingState extends SignInStates {}

class LoginSuccessState extends SignInStates {
  final SignInModel? signIn;
  LoginSuccessState(this.signIn);
}

class LoginErrorState extends SignInStates {
  final String? error;

  LoginErrorState(this.error);
}


abstract class SignUpStates {}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
  final SignUpModel? signUpModel;
  SignUpSuccessState(this.signUpModel);
}
class SignUpErrorState extends SignUpStates{}