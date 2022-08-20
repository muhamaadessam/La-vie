abstract class SignInStates {}

class LoginInitialState extends SignInStates {}

class LoginLoadingState extends SignInStates {}

class LoginSuccessState extends SignInStates {}

class LoginErrorState extends SignInStates {}

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}
