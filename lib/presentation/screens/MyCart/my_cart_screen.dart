import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/images.dart';

import '../../../Shared/Constant/text.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style:
              textStyle(color: Colors.black, weight: FontWeight.w700, size: 21),
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
      body: true
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('${imageAsset}Frame.png'),
                  const SizedBox(height: 36,),
                  Text(
                    'Your cart is empty',
                    style: textStyle(
                        size: 24, weight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(height: 16,),

                  Text(
                    'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                    style: textStyle(
                      size: 18,
                      weight: FontWeight.w400,
                      color: const Color.fromRGBO(33, 33, 33, .61),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
