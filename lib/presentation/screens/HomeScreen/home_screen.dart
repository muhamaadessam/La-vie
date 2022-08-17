import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/HomeScreen/filter_par.dart';
import 'package:la_vie/presentation/screens/HomeScreen/product_card.dart';
import 'package:la_vie/presentation/screens/HomeScreen/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List l = ['All', 'Plants', 'seeds', 'Tools'];
    List product = [
      'assets/images/product_image.png',
      '1',
      'GARDENIA PLANT',
      '70'
    ];
    return BlocConsumer<AppCubit, AppState>(
        builder: (context, state) => Scaffold(
              //extendBody: true,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Image.asset(
                  'assets/images/la_vie_logo.png',
                ),
              ),
              body: Column(
                children: [
                  const SearchBar(),
                  FilterBar(list: l),
                  Expanded(
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
                ],
              ),
            ),
        listener: (context, state) => () {});
  }
}
