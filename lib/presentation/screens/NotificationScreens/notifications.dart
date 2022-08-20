import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: (){
              print(SeedsCubit.get(context).seedsModel!.data!.toString());
            },
            child: Text(
        'Notifications Screen',
        style: textStyle(color: Colors.black,size:36 ),
      ),
          )),
    );
  }
}
