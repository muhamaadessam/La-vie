import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/presentation/screens/ProductScreen/edition_data.dart';

import '../../../Shared/Constant/images.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/product.png',
              colorBlendMode: BlendMode.softLight,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.4),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  children: const [
                    RowEditionData(
                      image: 'sun.png',
                      title: 'Sun light',
                      result: '78',
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    RowEditionData(
                      image: 'water.png',
                      title: 'Water Capacity',
                      result: '10',
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    RowEditionData(
                      image: 'thermometer.png',
                      title: 'Temperature',
                      result: '29',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      20,
                    ),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                //height: MediaQuery.of(context).size.height * .55,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SNAKE PLANT (SANSEVIERIA)',
                        style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                        style: GoogleFonts.roboto(
                            color: const Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Common Snake Plant Diseases',
                        style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'A widespread problem with snake plants is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant\'s soil is soggy, certain microorganisms such as Rhizoctonia and Pythium can begin to populate and multiply, spreading disease throughout th',
                        style: GoogleFonts.roboto(
                            color: const Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
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
                          height: 50,
                          child: Center(
                            child: Text(
                              'Go To Blog',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
