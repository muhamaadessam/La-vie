import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) => Scaffold(
              extendBody: true,
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                buttonBackgroundColor: primaryColor,
                index: cubit.currentIndex,
                items: [
                  bottomBarIcons(context,image: 'tap1',index: 0),
                  bottomBarIcons(context,image: 'qr-code-scan',index: 1),
                  bottomBarIcons(context,image: 'home',index: 2),
                  bottomBarIcons(context,image: 'Bell',index: 3),
                  bottomBarIcons(context,image: 'Group',index: 4),
                ],
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
              body: cubit.screens[AppCubit.get(context).currentIndex],
            ),
        listener: (context, state) => () {});
  }
}

Widget bottomBarIcons(context,{String? image,int? index}){
  return SizedBox(
    height: 24,
    width: 24,
    child: Image.asset(
      '$imageAsset$image.png',
      color: AppCubit.get(context).currentIndex != index ? Colors.black : Colors.white,
    ),
  );
}