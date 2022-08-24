import 'package:flutter/material.dart';

import '../../Shared/Constant/images.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.child, required this.imageUrl})
      : super(key: key);
  final Widget child;
  final String imageUrl;

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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: imageUrl != 'https://lavie.orangedigitalcenteregypt.com'
                    ? Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  '${imageAsset}product_image.png',
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
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}