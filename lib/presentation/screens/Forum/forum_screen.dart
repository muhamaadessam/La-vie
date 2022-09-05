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
    String searchController = '';
    ForumsCubit forums = ForumsCubit.get(context);
    MyForumsCubit myForums = MyForumsCubit.get(context);
    forums.getForumsData();
    myForums.getMyForumsData();
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
                forums.isAll!
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          onChanged: (value) {
                            searchController = value;
                            forums.getForumsDataBySearch(value: value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search',
                            fillColor: const Color.fromRGBO(248, 248, 248, 1),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    : Container(),
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
                                    if (forums.isAll!) {
                                      return Post(
                                        index: index,
                                        forumsCubit: forums,
                                        forumsModel: forums.forumsModel!,
                                      );
                                    } else if (!forums.isAll!) {
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
                                  itemCount: forums.isAll!
                                      ? (forums.forumsModel!.data!.length) > 8
                                          ? 20
                                          : forums.forumsModel!.data!.length
                                      : myForums.forumsModel!.data!.length),
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
