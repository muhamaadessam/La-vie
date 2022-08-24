import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) => WillPopScope(
              onWillPop: () => onBackButtonPressed(context),
              child: Scaffold(
                extendBody: true,
                bottomNavigationBar: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  buttonBackgroundColor: primaryColor,
                  index: cubit.currentIndex,
                  items: [
                    bottomBarIcons(context, image: 'tap1', index: 0),
                    bottomBarIcons(context, image: 'qr-code-scan', index: 1),
                    bottomBarIcons(context, image: 'home', index: 2),
                    bottomBarIcons(context, image: 'Bell', index: 3),
                    bottomBarIcons(context, image: 'Group', index: 4),
                  ],
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                ),
                body: cubit.screens[AppCubit.get(context).currentIndex],
              ),
            ),
        listener: (context, state) => () {});
  }
}

Widget bottomBarIcons(context, {String? image, int? index}) {
  return SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      '$imageAsset$image.png',
      color: AppCubit.get(context).currentIndex != index
          ? Colors.black
          : Colors.white,
    ),
  );
}

Future<bool> onBackButtonPressed(context) async {
  bool? exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          title: Text(
            'Exit App',
            style: textStyle(
              color: primaryColor,
              size: 20,
              weight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Do you want to close the app',
            style: textStyle(color: Colors.black, size: 16),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'NO',
                style: textStyle(color: Colors.white, size: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'YES',
                style: textStyle(color: Colors.white, size: 16),
              ),
            ),
          ],
        );
      });
  return exitApp ?? false;
}
