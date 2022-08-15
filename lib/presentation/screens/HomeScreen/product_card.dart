import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final List product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: 16,
                                  height: 16,
                                  color: const Color.fromRGBO(247, 247, 247, 1),
                                  child:
                                      Image.asset('assets/images/minus.png')),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(product[1]),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: 16,
                                  height: 16,
                                  color: const Color.fromRGBO(247, 247, 247, 1),
                                  child: Image.asset('assets/images/plus.png')),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          product[2],
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${product[3]} EGP',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(26, 188, 0, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
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
            child: Image.asset(
              product[0],
              //fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
