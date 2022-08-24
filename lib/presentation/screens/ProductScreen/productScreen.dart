import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/presentation/Components/navigation_bar.dart';
import 'package:la_vie/presentation/screens/Blogs/blogs_screen.dart';
import 'package:la_vie/presentation/screens/ProductScreen/edition_data.dart';

import '../../../Shared/Constant/images.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature})
      : super(key: key);
  final String name;
  final String description;
  final String imageUrl;
  final int waterCapacity;
  final int sunLight;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child:
                imageUrl == 'https://lavie.orangedigitalcenteregypt.com/api/v1'
                    ? Image.asset(
                        'assets/images/product.png',
                        colorBlendMode: BlendMode.softLight,
                        fit: BoxFit.fitWidth,
                      )
                    : Image.network(
                        imageUrl,
                        colorBlendMode: BlendMode.softLight,
                        fit: BoxFit.fitWidth,
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
                  children: [
                    RowEditionData(
                      image: 'sun.png',
                      title: 'Sun light',
                      result: sunLight.toString(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    RowEditionData(
                      image: 'water.png',
                      title: 'Water Capacity',
                      result: waterCapacity.toString(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    RowEditionData(
                      image: 'thermometer.png',
                      title: 'Temperature',
                      result: temperature.toString(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Container(
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
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          name,
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          description,
                          style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(151, 151, 151, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Spacer(
                          flex: 15,
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(26, 188, 0, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BlogsScreen()));
                          },
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
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
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
