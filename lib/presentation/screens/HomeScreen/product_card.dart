import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';

import '../Exam/qustion_screen.dart';

Widget productCard(context,
    {final String? image, String? name, int? numberForAddCart, int? price}) {
  return Stack(
    //alignment: Alignment.centerLeft,
    children: [
      Column(
        children: [
          const SizedBox(height: 32),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 9,
                shadowColor: Colors.black.withOpacity(.9),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              CartCubit.get(context).removeProductToCart();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey[400],
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text('${CartCubit.get(context).counter}'),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              CartCubit.get(context).addProductToCart();
                              print(CartCubit.get(context).counter);
                            },
                            child: Container(
                                width: 24,
                                height: 24,
                                color: const Color.fromRGBO(247, 247, 247, 1),
                                child: Image.asset('assets/images/plus.png')),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        name!,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '$price EGP',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('accessToken : ${CashHelper.get(key: 'accessToken')}');
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: Center(
                            child: Text(
                              'Add To Cart',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        top: 0,
        left: 0,
        child: SizedBox(
          width: 100,
          height: 150,
          child: image != 'https://lavie.orangedigitalcenteregypt.com'
              ? Image(image: NetworkImage(image!))
              : Image.asset('${imageAsset}product_image.png'),
        ),
      ),
    ],
  );
}
