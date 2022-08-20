import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage('url'),
                        radius: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Name',
                            style: textStyle(weight: FontWeight.w700, size: 13),
                          ),
                          Text(
                            'Time',
                            style: textStyle(
                              weight: FontWeight.w400,
                              size: 11,
                              color: const Color.fromRGBO(151, 151, 151, 1),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  'Title',
                  style: textStyle(
                    weight: FontWeight.w700,
                    size: 15,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'description',
                  style: textStyle(
                    weight: FontWeight.w400,
                    size: 11,
                    color: const Color.fromRGBO(143, 141, 141, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Image(
            image: NetworkImage('url'),
            width: double.infinity,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Color.fromRGBO(102, 101, 101, 1),
                ),
                Text(
                  '0 Like',
                  style: textStyle(
                    color: const Color.fromRGBO(0, 00, 0, .6),
                  ),
                ),
                const SizedBox(
                  width: 64,
                ),
                Text(
                  '2 Replies',
                  style: textStyle(
                    color: const Color.fromRGBO(0, 00, 0, .6),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
