abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

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