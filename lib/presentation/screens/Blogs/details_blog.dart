import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';

class DetailsBlog extends StatelessWidget {
  const DetailsBlog({Key? key, this.imageUrl, this.name, this.description})
      : super(key: key);
  final String? imageUrl;
  final String? name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: imageUrl == 'https://lavie.orangedigitalcenteregypt.com'
                  ? Image.asset(
                      '${imageAsset}product.png',
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(
                      imageUrl!,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: textStyle(
                        color: Colors.black,
                        weight: FontWeight.w600,
                        size: 23,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      description!,
                      style: textStyle(
                        color: const Color.fromRGBO(125, 123, 123, .78),
                        weight: FontWeight.w400,
                        size: 16,
                      ),
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
