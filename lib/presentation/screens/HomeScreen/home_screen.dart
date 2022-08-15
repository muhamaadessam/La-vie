import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/presentation/screens/HomeScreen/filter_par.dart';
import 'package:la_vie/presentation/screens/HomeScreen/product_card.dart';
import 'package:la_vie/presentation/screens/HomeScreen/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List l = ['All', 'Plants', 'seeds', 'Tools'];
    List product = [
      'assets/images/product_image.png',
      '1',
      'GARDENIA PLANT',
      '70'
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/la_vie_logo.png',
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: primaryColor,
        index: 2,
        items: [
          SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                'assets/images/tap1.png',
              )),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              'assets/images/qr-code-scan.png',
            ),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              'assets/images/home.png',
            ),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              'assets/images/Bell.png',
            ),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              'assets/images/Group.png',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          FilterBar(list: l),
          Expanded(
            child: SizedBox(
              //width: double.infinity,
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: .70,
                scrollDirection: Axis.vertical,
                children: List.generate(
                  20,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductCard(product: product),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
