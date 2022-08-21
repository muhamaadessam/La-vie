import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';

class BlogsCard extends StatelessWidget {
  const BlogsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 162,
      child: Card(
        elevation: 15,
        shadowColor: Colors.black.withOpacity(.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: AssetImage(
                    '${imageAsset}product.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  right: 16,
                ),
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
                      '5 Tips to treat plants ',
                      style: textStyle(
                          color: Colors.black,
                          weight: FontWeight.w600,
                          size: 17),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually leaf, in botany, any usually ',
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
            )
          ],
        ),
      ),
    );
  }
}
