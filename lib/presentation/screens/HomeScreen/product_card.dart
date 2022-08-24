import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      this.image,
      this.name,
      this.numberForAddCart,
      this.price,
      this.counter,
      this.id})
      : super(key: key);
  final String? image;
  final String? name;
  final int? numberForAddCart;
  final int? price;
  final int? counter;
  final String? id;

  @override
  Widget build(BuildContext context) {
    CartCubit cart = CartCubit.get(context);
    // ProductsCubit productsCubit = ProductsCubit.get(context);
    PlantsCubit plantsCubit = PlantsCubit.get(context);
    return Stack(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  cart.decreaseNumberProduct(id);
                                  debugPrint('${id!} : ${cart.numberProduct(id)}');
                                  //debugPrint('SeedsCubit :  ${plantsCubit.plantsModel!.data![1].description}');
                                  //debugPrint('return ${cart.numberProduct[id]}');
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: const Color.fromRGBO(247, 247, 247, 1),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.grey[400],
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            Text('${cart.numberProduct(id)}'),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  cart.increaseNumberProduct('0id');
                                  debugPrint('${id!} : ${cart.numberProduct(id)}');

                                  // debugPrint('${productsCubit.counter}');
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: const Color.fromRGBO(247, 247, 247, 1),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey[400],
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name!,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '$price EGP',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  print(
                                      'accessToken : ${CashHelper.get(key: 'accessToken')}');
                                  debugPrint('id : $id');
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
                        )
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
            width: 90,
            height: 160,
            child: image != 'https://lavie.orangedigitalcenteregypt.com'
                ? Image(
                    image: NetworkImage(image!),
                    fit: BoxFit.fitHeight,
                  )
                : Image.asset(
                    '${imageAsset}product_image.png',
                    fit: BoxFit.fitHeight,
                  ),
          ),
        ),
      ],
    );
  }
}
