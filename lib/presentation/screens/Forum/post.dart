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
    this.search,
  }) : super(key: key);

  final ForumsModel forumsModel;
  final ForumsCubit? forumsCubit;
  final MyForumsCubit? myForumsCubit;
  final int index;
  final String? search;

  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    ForumsCubit forums = ForumsCubit.get(context);
    MyForumsCubit myForums = MyForumsCubit.get(context);
    ImageProvider? imageProviderProfile;
    forumsModel.data![index].user!.imageUrl != ''
        ? imageProviderProfile =
            NetworkImage(forumsModel.data![index].user!.imageUrl!)
        : imageProviderProfile = AssetImage('${imageAsset}profile.png');
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
                        backgroundImage: imageProviderProfile,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              "${forumsModel.data![index].user!.firstName!} ${forumsModel.data![index].user!.lastName!}",
                              style:
                                  textStyle(weight: FontWeight.w700, size: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                          loadingBuilder: (context, child, loadingProgress) =>
                              (loadingProgress == null)
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator()),
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
                      TextButton(
                        onPressed: () {
                          if (myForumsCubit != null) {
                            myForums.makeLikePost(
                                forumsModel.data![index].forumId!);
                          }
                          if (forumsCubit != null) {
                            forums.makeLikePost(
                                forumsModel.data![index].forumId!);
                          }
                          forumsCubit!.lik = !forumsCubit!.lik!;
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              '${imageAsset}Like.png',
                              width: 18,
                              color: !forumsCubit!.lik!
                                  ? const Color.fromRGBO(0, 0, 0, .6)
                                  : primaryColor,
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
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Form(
                                  key: formKey,
                                  child: SizedBox(
                                    height: 200,
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      title: Text(
                                        'Add Comment',
                                        style: textStyle(
                                          color: primaryColor,
                                          size: 20,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      content: TextFormField(
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Entre your Comment';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: controller,
                                        maxLines: 1,
                                        cursorColor: primaryColor,
                                        decoration: InputDecoration(
                                          //label: Text('Comment'),
                                          labelText: 'Comment',
                                          labelStyle:
                                              textStyle(color: primaryColor),
                                          focusColor: primaryColor,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  147, 147, 147, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              if (myForumsCubit != null) {
                                                myForums.makeCommentPost(
                                                    forumsModel
                                                        .data![index].forumId!,
                                                    controller.text);
                                              }
                                              if (forumsCubit != null) {
                                                forums.makeCommentPost(
                                                    forumsModel
                                                        .data![index].forumId!,
                                                    controller.text);
                                              }
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                            'Comment',
                                            style: textStyle(
                                                color: Colors.white, size: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                          myForumsCubit!.getMyForumsData();
                        },
                        child: Text(
                          '${forumsModel.data![index].forumComments!.length} Replies',
                          style: textStyle(
                            color: const Color.fromRGBO(0, 00, 0, .6),
                          ),
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
