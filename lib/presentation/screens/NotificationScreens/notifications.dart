import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';

import '../Forum/post.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController=ScrollController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(
          child: ListView.separated(
            shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(width: 100,color: Colors.red,),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: 20),
        ),
      ),
    );
  }
}
