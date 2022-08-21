import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Models/seedsModel.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/Blogs/blogs_screen.dart';
import 'package:la_vie/presentation/screens/Forum/forum_screen.dart';
import '../../Models/plantsModel.dart';
import '../../Models/product_model.dart';
import '../../Models/toolsModel.dart';
import '../../Models/user_model.dart';
import '../../presentation/screens/HomeScreen/home_screen.dart';
import '../../presentation/screens/NotificationScreens/notifications.dart';
import '../../presentation/screens/Profile/profile_screen.dart';
import '../../presentation/screens/QRCodeScreen/qr_code_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> screens = [
    const BlogsScreen(),
    const QRCodeScreen(),
    const HomeScreen(),
    const ForumScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
}

class SeedsCubit extends Cubit<SeedsStates> {
  SeedsCubit() : super(SeedsInitialState());

  static SeedsCubit get(context) => BlocProvider.of(context);
  SeedsModel? seedsModel;

  void getSeedsData() {
    emit(SeedsLoadingState());
    DioHelper.getData(
      endPoint: seeds,
      method: '',
    ).then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      print('seeds Data : ${seedsModel!.data![1].description}');
      emit(SeedsSuccessState());
    }).catchError((error) {
      emit(SeedsErrorState());
      print('Seeds error: ${error.toString()}');
    });
  }
}

class PlantsCubit extends Cubit<PlantsStates> {
  PlantsCubit() : super(PlantsInitialState());

  static PlantsCubit get(context) => BlocProvider.of(context);
  PlantsModel? plantsModel;

  void getPlantsData() {
    emit(PlantsLoadingState());
    DioHelper.getData(
      endPoint: plants,
      method: '',
    ).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
      print('Plant Data : ${plantsModel!.data![1].description}');
      emit(PlantsSuccessState());
    }).catchError((error) {
      emit(PlantsErrorState());
      print('Plant error: ${error.toString()}');
    });
  }
}

class ToolsCubit extends Cubit<ToolsStates> {
  ToolsCubit() : super(ToolsInitialState());

  static ToolsCubit get(context) => BlocProvider.of(context);
  ToolsModel? toolsModel;

  void getToolsData() {
    emit(ToolsLoadingState());
    DioHelper.getData(
      endPoint: tools,
      method: '',
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      print('Toolss Data : ${toolsModel!.data![1].description}');
      emit(ToolsSuccessState());
    }).catchError((error) {
      emit(ToolsErrorState());
      print('Tools error: ${error.toString()}');
    });
  }
}

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);
  ProductsModel? productsModel;

  void getProductsData() {
    emit(ProductsLoadingState());
    DioHelper.getData(
      endPoint: products,
      method: '',
    ).then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      print('Product Data : ${productsModel!.data![1].description}');
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState());
      print('Product error : ${error.toString()}');
    });
  }
}

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);
  int counter = 1;

  void addProductToCart() {
    counter++;
    emit(CartNumberProductState());
  }

  void removeProductToCart() {
    counter--;
    emit(CartNumberProductState());
  }
}

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void getUserData({String? method}) {
    emit(UserLoadingState());
    DioHelper.getData(
      endPoint: USER,
      method: method,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('Cart Data : ${userModel!.data!.userId}');
      emit(UserSuccessState());
    }).catchError((error) {
      emit(UserErrorState());
      print('Cart error : ${error.toString()}');
    });
  }

  void patchUserData({
    required String? method,
    required String? email,
    required String? firstName,
    required String? lastName,
    required String? address,
  }) {
    emit(UserLoadingState());
    DioHelper.postData(
      endPoint: USER,
      method: method,
      data: {
        {
          "firstName": firstName,
          "lastName": lastName,
          "email": lastName,
          "address": address
        }
      },
    ).then((value) {
      emit(UserSuccessState());
    }).catchError((error) {
      emit(UserErrorState());
      print('error seeds: ${error.toString()}');
    });
  }
}

