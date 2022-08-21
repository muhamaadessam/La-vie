import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/Blogs/card_blogs.dart';

import '../../../Shared/Constant/text.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Blogs',
          style:
              textStyle(color: Colors.black, weight: FontWeight.w700, size: 21),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => const BlogsCard(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
