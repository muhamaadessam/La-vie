import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/NotificationScreens/notification_design.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit user = UserCubit.get(context);

    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) => () {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Container(),
            leadingWidth: 0,
            elevation: 0,
            title: Text(
              'Notification',
              style: textStyle(color: Colors.black, size: 19),
            ),
          ),
          body:  state is UserLoadingState || user.userModel == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => NotificationDesign(
                  message:
                      user.userModel!.data!.userNotification![index].message,
                  createAt:
                      user.userModel!.data!.userNotification![index].createdAt,
                  imageUrl:
                      user.userModel!.data!.userNotification![index].imageUrl),
              separatorBuilder: (context, index) => const Divider(
                indent: 8,
                endIndent: 8,
                thickness: 1,
                color: Color.fromRGBO(151, 151, 151, 1),
              ),
              itemCount: user.userModel!.data!.userNotification!.length),
        );
      },
    );
  }
}
