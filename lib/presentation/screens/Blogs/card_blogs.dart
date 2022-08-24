import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/presentation/screens/Blogs/details_blog.dart';
import '../../Components/custom_card.dart';

class BlogsCard extends StatelessWidget {
  const BlogsCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl})
      : super(key: key);
  final String? title;
  final String? description;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsBlog(
              name: title,
              imageUrl: imageUrl,
              description: description,
            ),
          ),
        );
      },
      child: CustomCard(
        imageUrl: imageUrl!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2 days age',
              style: textStyle(
                color: primaryColor,
                weight: FontWeight.w400,
                size: 13,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title!,
              style: textStyle(
                  color: Colors.black, weight: FontWeight.w600, size: 17),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              description!,
              style: textStyle(
                  color: const Color.fromRGBO(125, 123, 123, .78),
                  weight: FontWeight.w400,
                  size: 13),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
