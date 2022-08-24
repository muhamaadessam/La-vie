import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Models/forums_model.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/Forum/post.dart';

import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/images.dart';
import '../../../Shared/Constant/text.dart';
import '../HomeScreen/search_bar.dart';

class ForumsSearch extends StatelessWidget {
  const ForumsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? searchController = TextEditingController();
    ForumsCubit forumsCubit = ForumsCubit.get(context);
    ForumsModel? forumsModel = forumsCubit.forumsModel;
    ImageProvider? imageProvider;
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Forums Search',
              style: textStyle(
                  color: Colors.black, weight: FontWeight.w700, size: 21),
            ),
            //leadingWidth: 0,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: TextFormField(
                    onChanged: (value) {
                      forumsCubit.getSearch(value);
                      debugPrint(value.toString());
                    },
                    controller: searchController,
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
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                forumsCubit.search == null
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: imageProvider,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name',
                                              style: textStyle(
                                                  weight: FontWeight.w700,
                                                  size: 16),
                                            ),
                                            Text(
                                              'Time',
                                              style: textStyle(
                                                weight: FontWeight.w400,
                                                size: 14,
                                                color: const Color.fromRGBO(
                                                    151, 151, 151, 1),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          forumsCubit.search![0].data![0].title!,
                                          style: textStyle(
                                            weight: FontWeight.w700,
                                            size: 18,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Text(
                                          forumsCubit.search![0].data![0].description!,
                                          style: textStyle(
                                            weight: FontWeight.w400,
                                            size: 15,
                                            color: const Color.fromRGBO(
                                                143, 141, 141, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: forumsCubit.search![0].data![0].imageUrl! !=
                                            'https://lavie.orangedigitalcenteregypt.comnull'
                                        ? Image(
                                            image: NetworkImage(forumsCubit.search![0].data![0].imageUrl!),
                                            width: double.infinity,
                                          )
                                        : Image.asset(
                                            '${imageAsset}product_image.png',
                                            width: double.infinity,
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 16),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            /*myForums.makeLikePost(
                                          forumsModel.data![index].forumId!);
                                      debugPrint(
                                          myForums.forumsModel!.data![index].forumId!);*/
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                '${imageAsset}Like.png',
                                                width: 18,
                                              ),
                                              Text(
                                                '  ${forumsCubit.search![0].data![0].forumLikes!.length} Like',
                                                style: textStyle(
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, .6),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Text(
                                          '${forumsCubit.search![0].data![0].forumComments!.length} Replies',
                                          style: textStyle(
                                            color: const Color.fromRGBO(
                                                0, 00, 0, .6),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 4,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                /*SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,
                              index) => Post(forumsModel: forumsModel!, index: index,forumsCubit: forumsCubit,) */ /*Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 200,
                            child: Text(
                              '$index',
                              style: textStyle(color: Colors.green, size: 70),
                            ),
                          )*/ /*,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                      itemCount: list!['ll']),
                )*/
              ],
            ),
          ),
        );
      },
    );
  }
}
