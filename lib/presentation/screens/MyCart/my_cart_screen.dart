import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/presentation/screens/MyCart/cart_card.dart';

import '../../../Shared/Constant/colors.dart';
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
      body: false
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('${imageAsset}Frame.png'),
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Your cart is empty',
                    style: textStyle(
                        size: 24, weight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .74,
                  child: ListView.separated(
                    itemBuilder: (context, index) => const CartCard(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemCount: 20,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 36),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total',
                              style: textStyle(
                                size: 20,
                                weight: FontWeight.w600,
                                color: Colors.black.withOpacity(.75),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '4000',
                                  style: textStyle(
                                    size: 16,
                                    weight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                                Text(
                                  ' EGP',
                                  style: textStyle(
                                    size: 20,
                                    weight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Checkout',
                              style: textStyle(
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
