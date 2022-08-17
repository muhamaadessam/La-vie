import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Models/signup_model.dart';
import 'package:la_vie/Models/user.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/Registration/cubit/states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(LoginInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);
  SignInModel signInModel = SignInModel();

  void userSignIn({
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
    ).then(
      (value) {
        //print(value.data);
        signInModel = SignInModel.fromJson(value.data);
        print(signInModel.data);
        print(signInModel.type);
        emit(LoginSuccessState(signInModel));
      },
    ).catchError(
      (error) {
        emit(
          LoginErrorState(
            error.toString(),
          ),
        );
        print('error : $error');
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
    ).then(
      (value) {
        //print(value.data);
        signUpModel = SignUpModel.fromJson(value.data);
        print(signUpModel.user);
        print(signUpModel.type);
        emit(SignUpSuccessState(signUpModel));
      },
    ).catchError(
      (error) {
        emit(
          SignUpErrorState(),
        );
        print('error : $error');
      },
    );
  }
}
