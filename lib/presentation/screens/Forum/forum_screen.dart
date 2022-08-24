import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/Forum/create_new_post.dart';
import 'package:la_vie/presentation/screens/Forum/forum_search.dart';
import 'package:la_vie/presentation/screens/Forum/post.dart';
import 'package:la_vie/presentation/screens/HomeScreen/search_bar.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController listScrollController = ScrollController();
    ScrollController singleScrollController = ScrollController();
    ForumsCubit forums = ForumsCubit.get(context);
    MyForumsCubit myForums = MyForumsCubit.get(context);
    forums.getForumsData();
    myForums.getMyForumsData();
    //forums.getSearch('');
    return BlocConsumer<MyForumsCubit, MyForumsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => BlocConsumer<ForumsCubit, ForumsStates>(
        listener: (context, state) => () {},
        builder: (context, state) => Scaffold(
          //padding bottom 80 if have bottom navigation bar
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //print('image Url Null:${forums.forumsModel!.data![5].imageUrl}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreatePost(),
                ),
              );
            },
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Discussion Forums',
              style: textStyle(
                  color: Colors.black, weight: FontWeight.w700, size: 21),
            ),
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => const ForumsSearch()));
            //     },
            //     icon: const Icon(
            //       Icons.search,
            //       color: Colors.black,
            //     ),
            //   ),
            // ],
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
          body: SingleChildScrollView(
            controller: singleScrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SearchBar(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('All Form');
                              forums.getForumsData();
                              print(forums.forumsModel!.data![4].title);
                              forums.changeForumsData(true);
                            },
                            style: forums.buttonStyle2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'All Forum',
                                style: forums.textStyle2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          ElevatedButton(
                              style: forums.buttonStyle1,
                              onPressed: () {
                                forums.changeForumsData(false);
                                myForums.getMyForumsData();
                                print(forums.forumsModel!.data![4].title);
                                print('My Forums');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'My Forums',
                                  style: forums.textStyle1,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      forums.forumsModel == null || myForums.forumsModel == null
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              width: double.infinity,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  controller: listScrollController,
                                  itemBuilder: (context, index) {
                                    if (forums.forumsModel!.data!.isNotEmpty) {
                                      return Post(
                                        index: index,
                                        forumsCubit: forums,
                                        forumsModel: forums.forumsModel!,
                                      );
                                    } else if (myForums
                                        .forumsModel!.data!.isNotEmpty) {
                                      return Post(
                                        myForumsCubit: myForums,
                                        index: index,
                                        forumsModel: myForums.forumsModel!,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 16,
                                      ),
                                  itemCount:
                                      myForums.forumsModel!.data!.length),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
