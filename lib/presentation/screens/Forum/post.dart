import 'package:flutter/material.dart';
import 'package:la_vie/Models/forums_model.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.forumsModel,
    required this.index,
    this.forumsCubit,
    this.myForumsCubit,
  }) : super(key: key);

  final ForumsModel forumsModel;
  final ForumsCubit? forumsCubit;
  final MyForumsCubit? myForumsCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    ForumsCubit forums = ForumsCubit.get(context);
    MyForumsCubit myForums = MyForumsCubit.get(context);
    ImageProvider? imageProvider;
    forumsModel.data![index].imageUrl !=
            'https://lavie.orangedigitalcenteregypt.comnull'
        ? imageProvider = NetworkImage(forumsModel.data![index].imageUrl!)
        : imageProvider = AssetImage('${imageAsset}profile.png');
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: textStyle(weight: FontWeight.w700, size: 16),
                          ),
                          Text(
                            'Time',
                            style: textStyle(
                              weight: FontWeight.w400,
                              size: 14,
                              color: const Color.fromRGBO(151, 151, 151, 1),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        forumsModel.data![index].title!,
                        style: textStyle(
                          weight: FontWeight.w700,
                          size: 18,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        forumsModel.data![index].description!,
                        style: textStyle(
                          weight: FontWeight.w400,
                          size: 15,
                          color: const Color.fromRGBO(143, 141, 141, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: forumsModel.data![index].imageUrl !=
                          'https://lavie.orangedigitalcenteregypt.comnull'
                      ? Image(
                          image:
                              NetworkImage(forumsModel.data![index].imageUrl!),
                          width: double.infinity,
                        )
                      : Image.asset(
                          '${imageAsset}product_image.png',
                          width: double.infinity,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          myForums.makeLikePost(
                              forumsModel.data![index].forumId!);
                          debugPrint(
                              myForums.forumsModel!.data![index].forumId!);
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              '${imageAsset}Like.png',
                              width: 18,
                            ),
                            Text(
                              '  ${forumsModel.data![index].forumLikes!.length} Like',
                              style: textStyle(
                                color: const Color.fromRGBO(0, 0, 0, .6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        '${forumsModel.data![index].forumComments!.length} Replies',
                        style: textStyle(
                          color: const Color.fromRGBO(0, 00, 0, .6),
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
    );
  }
}
