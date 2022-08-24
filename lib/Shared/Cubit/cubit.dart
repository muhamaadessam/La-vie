import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/Models/blogs_model.dart';
import 'package:la_vie/Models/cart_model.dart';
import 'package:la_vie/Models/forums_model.dart';
import 'package:la_vie/Models/seedsModel.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/Shared/Network/Remote/dio_helper.dart';
import 'package:la_vie/presentation/screens/Blogs/blogs_screen.dart';
import 'package:la_vie/presentation/screens/NotificationScreens/notifications.dart';
import '../../Models/plantsModel.dart';
import '../../Models/product_model.dart';
import '../../Models/toolsModel.dart';
import '../../Models/user_model.dart';
import '../../presentation/Components/navigation_bar.dart';
import '../../presentation/screens/HomeScreen/home_screen.dart';
import '../../presentation/screens/Profile/profile_screen.dart';
import '../../presentation/screens/QRCodeScreen/qr_code_screen.dart';
import 'package:la_vie/Models/signup_model.dart';
import 'package:la_vie/Models/signin_model.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'dart:io';
import '../Constant/colors.dart';
import '../Constant/text.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  List<Widget> screens = [
    const BlogsScreen(),
    QRCodeScreen(),
    const HomeScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  String scanBarcode = 'Unknown';
  PlantsModel? plantsModel;

  Future<void> scanQR() async {
    emit(QRLoadingState());
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ffffff', 'Cancel', false, ScanMode.QR);
      //barcodeScanRes = result
      DioHelper.getData(
          endPoint: plants,
          method: '{plantId}',
          query: {'plantId': barcodeScanRes}).then((value) {
        plantsModel = PlantsModel.fromJson(value.data);
        //debugPrint('Plant id : ${plantsModel!.data![0].plantId}');
        scanBarcode = barcodeScanRes;
        debugPrint('barcodeScanRes: $barcodeScanRes');
        emit(QRSuccessState());
      }).catchError((error){
        debugPrint('error her :${error.toString()}');
        emit(QRErrorState());
      });
      scanBarcode = barcodeScanRes;
      debugPrint('barcodeScanRes: $barcodeScanRes');
      emit(AppChangeBottomNavBarState());
    }catch(e) {
     debugPrint('error her :${e.toString()}');
    }
  }
}

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
      CashHelper.put(
          key: 'accessToken', value: signInModel.data!.accessToken!.toString());
      CashHelper.put(
          key: 'refreshToken',
          value: signInModel.data!.refreshToken!.toString());
      ACCESS_TOKEN = signInModel.data!.accessToken!.toString();
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
        print('SignIn error : ${error.toString()}');
      },
    );
  }
}

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  SignUpModel signUpModel = SignUpModel();

  void userSignUp(
    context, {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
      emit(SignUpSuccessState());
    }).catchError(
      (error) {
        emit(SignUpErrorState());
        print('SignUP error : $error');
      },
    );
  }
}

class HomeTapsCubit extends Cubit<HomeTabsStates> {
  HomeTapsCubit() : super(HomeTabsInitialState());

  static HomeTapsCubit get(context) => BlocProvider.of(context);
  int index = 0;

  TextStyle? textStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: primaryColor,
  );

  ButtonStyle? buttonStyle = ButtonStyle(
    side: MaterialStateProperty.resolveWith(
      (states) => BorderSide(
        width: 1,
        color: primaryColor,
      ),
    ),
    elevation: MaterialStateProperty.resolveWith((states) => 0),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) => const Color.fromRGBO(248, 248, 248, 1),
    ),
  );

  void changeTab(int? currentIndex) {
    index = currentIndex!;
    buttonStyle = ButtonStyle(
      side: MaterialStateProperty.resolveWith(
        (states) => BorderSide(
          width: 1,
          color: primaryColor,
        ),
      ),
      elevation: MaterialStateProperty.resolveWith((states) => 0),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) => const Color.fromRGBO(248, 248, 248, 1),
      ),
    );
    textStyle = GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: primaryColor,
    );
    //}
    /*else {
      buttonStyle = ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => const Color.fromRGBO(248, 248, 248, 1),
        ),
      );
      textStyle = GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: const Color.fromRGBO(151, 151, 151, 1),
      );
    }*/
    emit(HomeTabsChangeState());
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
  Map<String, int> numberProduct = {};
  int counter = 1;

  void increaseNumberProduct(String? id) {
    numberProduct[id.toString()] = (numberProduct[id.toString()]! + 1);
    emit(ProductsChangeNumberProductState());
  }

  void decreaseNumberProduct(String? id) {
    if (numberProduct[id.toString()]! > 1) {
      numberProduct[id.toString()] = (numberProduct[id.toString()]! - 1);
    }
    emit(ProductsChangeNumberProductState());
  }

  void getProductsData() {
    emit(ProductsLoadingState());
    DioHelper.getData(
      endPoint: products,
      method: '',
    ).then((value) {
      productsModel = ProductsModel.fromJson(value.data);

      productsModel!.data!.forEach((element) {
        numberProduct.addAll({element.productId.toString(): counter});
      });
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

  // int counter = 0;

  List<CartModel> data = [
    CartModel(id: '0id', numberProduct: 5),
  ];

  void increaseNumberProduct(String? id) {
    //debugPrint(id);
    //debugPrint(id);

    for (var element in data) {
      debugPrint('element.id :${element.id}');
      debugPrint(element.id);
      if (element.id == id) {
        element.numberProduct++;
        debugPrint(element.numberProduct.toString());
      } else {
        data.add(CartModel(id: id, numberProduct: 1));
      }
    }
    emit(CartNumberProductState());
  }

  int numberProduct(String? id) {
    for (var element in data) {
      if (element.id == id) {
        return element.numberProduct;
      } else {
        return 0;
      }
    }
    emit(CartNumberProductState());
    return 0;
  }

  void decreaseNumberProduct(String? id) {
    data.forEach((element) {
      if (element.id == id) {
        element.numberProduct--;
      }
    });
    emit(CartNumberProductState());
  }

  void addProductToCart() {}

  void removeProductToCart() {}
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
      print('User email : ${userModel!.data!.email}');
      emit(UserSuccessState());
    }).catchError((error) {
      emit(UserErrorState());
      print('User error : ${error.toString()}');
    });
  }

  void patchUserData({
    required String? email,
    required String? firstName,
    required String? lastName,
    required String? address,
  }) {
    emit(UserLoadingState());
    DioHelper.patchData(
      endPoint: USER,
      method: 'me',
      data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address
      },
    ).then((value) {
      getUserData(method: 'me');
      emit(UserSuccessState());
    }).catchError((error) {
      emit(UserErrorState());
      print('error user: ${error.toString()}');
    });
  }
}

class BlogsCubit extends Cubit<BlogsStates> {
  BlogsCubit() : super(BlogsInitialState());

  static BlogsCubit get(context) => BlocProvider.of(context);

  //PlantsModel? plantsModel;
  BlogsModel? blogsModel;
  List<dynamic>? allBlogs;

  void getBlogsData() {
    emit(BlogsLoadingState());
    DioHelper.getData(
      endPoint: products,
      method: '/blogs',
    ).then((value) {
      blogsModel = BlogsModel.fromJson(value.data);
      allBlogs = List.from(blogsModel!.data!.tools!)
        ..addAll(blogsModel!.data!.seeds!)
        ..addAll(blogsModel!.data!.plants!);
      print('Blogs Data : ${blogsModel!.data!.tools![1].name}');
      emit(BlogsSuccessState());
    }).catchError((error) {
      emit(BlogsErrorState());
      print('Blogs error: ${error.toString()}');
    });
  }
}

class ForumsCubit extends Cubit<ForumsStates> {
  ForumsCubit() : super(ForumsInitialState());

  static ForumsCubit get(context) => BlocProvider.of(context);

  ForumsModel? forumsModel;
  List<ForumsModel>? search = [];

  File? image;

  void getSearch(String? id) {
    emit(ForumsSearchLoadingState());
    DioHelper.getData(endPoint: forums, method: '/$id').then((value) {
      forumsModel = ForumsModel.fromJson(value.data);
      search!.add(forumsModel!);
      print('Search forumId : ${value.data['data']['forumId']}');
      emit(ForumsSearchSuccessState());
    }).onError((error, stackTrace) {
      debugPrint('Error data: $error');
      emit(ForumsSearchErrorState());
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      emit(ForumsAddImagePostLoadingState());
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      debugPrint('image : ${imageTemporary.path}');
      this.image = imageTemporary;
      emit(ForumsAddImagePostSuccessState());
    } on PlatformException catch (e) {
      debugPrint('failed to pick image : $e');
      emit(ForumsAddImagePostErrorState());
    }
  }

  Future<ImageSource?> showImageSource(context) async {
    emit(ForumsAddImagePostLoadingState());
    return showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: primaryColor,
              ),
              title: Text(
                'Camera',
                style: textStyle(color: Colors.black),
              ),
              onTap: () {
                pickImage(ImageSource.camera);
                Navigator.of(context).pop(ImageSource.camera);
                emit(ForumsAddImagePostSuccessState());
              }),
          ListTile(
            leading: Icon(
              Icons.image,
              color: primaryColor,
            ),
            title: Text(
              'Gallery',
              style: textStyle(color: Colors.black),
            ),
            onTap: () {
              pickImage(ImageSource.gallery);
              Navigator.of(context).pop(ImageSource.camera);
              emit(ForumsAddImagePostSuccessState());
            },
          ),
        ],
      ),
    );
  }

  void forumsAddPost({
    String? title,
    String? description,
    String? imageBase64,
  }) {
    emit(ForumsAddPostLoadingState());
    DioHelper.postData(
      endPoint: forums,
      method: '',
      data: {
        "title": title,
        "description": description,
        "imageBase64": imageBase64,
      },
    ).then((value) {
      debugPrint("value : ${value.data}");
      emit(ForumsAddPostSuccessState());
    }).catchError(
      (error) {
        image = null;
        emit(ForumsAddPostErrorState());
        debugPrint('Add Post error : ${error.toString()}');
      },
    );
  }

  void getForumsData() {
    emit(ForumsLoadingState());
    DioHelper.getData(
      endPoint: forums,
      method: '',
    ).then((value) {
      forumsModel = ForumsModel.fromJson(value.data);
      print('Forums Data : ${forumsModel!.data![1].description}');
      emit(ForumsSuccessState());
    }).catchError((error) {
      emit(ForumsErrorState());
      print('Forums error: ${error.toString()}');
    });
  }

  ButtonStyle? buttonStyle1 = ButtonStyle(
    side: MaterialStateProperty.resolveWith(
      (states) => BorderSide(
        color: Colors.black.withOpacity(.13),
      ),
    ),
    elevation: MaterialStateProperty.resolveWith((states) => 0),
    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
  );
  ButtonStyle? buttonStyle2 = ButtonStyle(
    elevation: MaterialStateProperty.resolveWith((states) => 0),
  );
  TextStyle? textStyle1 = textStyle(
    color: Colors.grey[400],
    weight: FontWeight.w500,
    size: 12,
  );
  TextStyle? textStyle2 = textStyle(
    color: Colors.white,
    weight: FontWeight.w500,
    size: 12,
  );

  void changeForumsData(bool forumsIsAll) {
    if (!forumsIsAll) {
      buttonStyle1 = ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
      );
      buttonStyle2 = ButtonStyle(
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
            color: Colors.black.withOpacity(.13),
          ),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white),
      );
      textStyle1 = textStyle(
        color: Colors.white,
        weight: FontWeight.w500,
        size: 12,
      );
      textStyle2 = textStyle(
        color: Colors.grey[400],
        weight: FontWeight.w500,
        size: 12,
      );
    } else {
      buttonStyle2 = ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
      );
      buttonStyle1 = ButtonStyle(
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
            color: Colors.black.withOpacity(.13),
          ),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white),
      );

      textStyle2 = textStyle(
        color: Colors.white,
        weight: FontWeight.w500,
        size: 12,
      );
      textStyle1 = textStyle(
        color: Colors.grey[400],
        weight: FontWeight.w500,
        size: 12,
      );
    }
    emit(ForumsChangeFromAllToMeState());
  }
}

class MyForumsCubit extends Cubit<MyForumsStates> {
  MyForumsCubit() : super(MyForumsInitialState());

  static MyForumsCubit get(context) => BlocProvider.of(context);

  ForumsModel? forumsModel;

  void getMyForumsData() {
    emit(MyForumsLoadingState());
    DioHelper.getData(
      endPoint: forums,
      method: '/me',
    ).then((value) {
      forumsModel = ForumsModel.fromJson(value.data);
      print('Forums me Data : ${forumsModel!.data![1].description}');
      emit(MyForumsSuccessState());
    }).catchError((error) {
      emit(MyForumsErrorState());
      print('Forums me error: ${error.toString()}');
    });
  }

  void makeLikePost(String? id) {
    ///api/v1/forums/{forumId}/like
    DioHelper.postData(endPoint: forums, method: '/$id/like', data: {});
  }
}
