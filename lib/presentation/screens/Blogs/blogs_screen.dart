import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/presentation/screens/Blogs/card_blogs.dart';
import '../../../Shared/Constant/text.dart';
import '../../../Shared/Cubit/states.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogsCubit? blogs = BlogsCubit.get(context);
    //blogs.getBlogsData();
    return BlocConsumer<BlogsCubit, BlogsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Blogs',
            style: textStyle(
                color: Colors.black, weight: FontWeight.w700, size: 21),
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
        body:state is BlogsLoadingState? const Center(child: CircularProgressIndicator()):Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemBuilder: (context, index) => BlogsCard(
              title: blogs.allBlogs![index].name,
              description: blogs.allBlogs![index].description,
              imageUrl:  blogs.allBlogs![index].imageUrl,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: blogs.allBlogs!.length,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
