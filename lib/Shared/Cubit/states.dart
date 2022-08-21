
abstract class AppState {}
class AppInitialState extends AppState {}
class AppChangeBottomNavBarState extends AppState {}

abstract class SignInStates {}
class LoginInitialState extends SignInStates {}
class LoginLoadingState extends SignInStates {}
class LoginSuccessState extends SignInStates {}
class LoginErrorState extends SignInStates {}

abstract class HomeTabsStates {}
class HomeTabsInitialState extends HomeTabsStates {}
class HomeTabsChangeState extends HomeTabsStates {}

abstract class SignUpStates {}
class SignUpInitialState extends SignUpStates {}
class SignUpLoadingState extends SignUpStates {}
class SignUpSuccessState extends SignUpStates {}
class SignUpErrorState extends SignUpStates {}

abstract class FilterStates {}
class FilterInitialState extends FilterStates {}
class FilterLoadingState extends FilterStates {}
class FilterSuccessState extends FilterStates {}
class FilterErrorState extends FilterStates {}

abstract class SeedsStates{}
class SeedsInitialState extends SeedsStates {}
class SeedsLoadingState extends SeedsStates {}
class SeedsSuccessState extends SeedsStates {}
class SeedsErrorState extends SeedsStates {}

abstract class PlantsStates{}
class PlantsInitialState extends PlantsStates {}
class PlantsLoadingState extends PlantsStates {}
class PlantsSuccessState extends PlantsStates {}
class PlantsErrorState extends PlantsStates {}

abstract class ToolsStates{}
class ToolsInitialState extends ToolsStates {}
class ToolsLoadingState extends ToolsStates {}
class ToolsSuccessState extends ToolsStates {}
class ToolsErrorState extends ToolsStates {}

abstract class ProductsStates{}
class ProductsInitialState extends ProductsStates {}
class ProductsLoadingState extends ProductsStates {}
class ProductsSuccessState extends ProductsStates {}
class ProductsErrorState extends ProductsStates {}

abstract class CartStates{}
class CartInitialState extends CartStates {}
class CartLoadingState extends CartStates {}
class CartSuccessState extends CartStates {}
class CartErrorState extends CartStates {}
class CartAddProductState extends CartStates {}
class CartNumberProductState extends CartStates {}


abstract class UserStates{}
class UserInitialState extends UserStates {}
class UserLoadingState extends UserStates {}
class UserSuccessState extends UserStates {}
class UserErrorState extends UserStates {}


abstract class BlogsStates{}
class BlogsInitialState extends BlogsStates {}
class BlogsLoadingState extends BlogsStates {}
class BlogsSuccessState extends BlogsStates {}
class BlogsErrorState extends BlogsStates {}

abstract class ForumsStates{}
class ForumsInitialState extends ForumsStates {}
class ForumsChangeFromAllToMeState extends ForumsStates {}
class ForumsLoadingState extends ForumsStates {}
class ForumsSuccessState extends ForumsStates {}
class ForumsErrorState extends ForumsStates {}

abstract class MyForumsStates{}
class MyForumsInitialState extends MyForumsStates {}
class MyForumsLoadingState extends MyForumsStates {}
class MyForumsSuccessState extends MyForumsStates {}
class MyForumsErrorState extends MyForumsStates {}