import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('${imageAsset}profile.png'),
                        radius: 25,
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
                        'Title',
                        style: textStyle(
                          weight: FontWeight.w700,
                          size: 18,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        'description',
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
                  child: Image(
                    image: AssetImage('${imageAsset}PicPost.png'),
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0,left: 16),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            '${imageAsset}Like.png',
                            width: 18,
                          ),
                          Text(
                            '  0 Like',
                            style: textStyle(
                              color: const Color.fromRGBO(0, 00, 0, .6),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        '2 Replies',
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
