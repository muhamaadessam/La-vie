import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/HomeScreen/components.dart';
import 'package:la_vie/presentation/screens/HomeScreen/product_card.dart';
import 'package:la_vie/presentation/screens/HomeScreen/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SeedsCubit? seeds = SeedsCubit.get(context);
    ToolsCubit? tools = ToolsCubit.get(context);
    ProductsCubit? products = ProductsCubit.get(context);
    PlantsCubit? plants = PlantsCubit.get(context);
    seeds.getSeedsData();
    tools.getToolsData();
    products.getProductsData();
    plants.getPlantsData();
    // print('plants data: ${plants.plantsModel!.data![0].description.toString()}');
    return BlocConsumer<SeedsCubit, SeedsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) => () {},
        builder: (context, state) => DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: Container(),
              elevation: 0,
              title: SizedBox(
                height: 45,
                child: Image.asset(
                  'assets/images/la_vie_logo.png',
                ),
              ),
            ),
            body: Column(
              children: [
                const SearchBar(),
                //FilterBar(),
                TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: primaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: primaryColor,
                  labelStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                  indicatorWeight: 0,
                  indicatorPadding:const EdgeInsets.symmetric(horizontal: 16) ,
                  unselectedLabelStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  unselectedLabelColor: const Color.fromRGBO(151, 151, 151, 1),
                  tabs: [
                    customTab(text: "All"),
                    customTab(text: "Plants"),
                    customTab(text: "Seeds"),
                    customTab(text: "Tools"),
                  ],
                ),
                 SizedBox(
                  height: 678,
                  width: double.infinity,
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      products.productsModel == null
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: .70,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        products.productsModel!.data!.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: productCard(context,
                              image:
                                  '${products.productsModel!.data![index].imageUrl}',
                              name: products.productsModel!.data![index].name,
                              price: 5,
                              numberForAddCart: 1),
                        ),
                      ),
                    ),
                      plants.plantsModel == null
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: .70,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                          plants.plantsModel!.data!.length,
                              (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: productCard(context,
                                image:
                                '${plants.plantsModel!.data![index].imageUrl}',
                                name: plants.plantsModel!.data![index].name,
                                price: 5,
                                numberForAddCart: 1),
                          ),
                        ),
                      ),
                      seeds.seedsModel == null
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: .70,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                          seeds.seedsModel!.data!.length,
                              (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: productCard(context,
                                image:
                                '${seeds.seedsModel!.data![index].imageUrl}',
                                name: seeds.seedsModel!.data![index].name,
                                price: 5,
                                numberForAddCart: 1),
                          ),
                        ),
                      ),
                      tools.toolsModel == null
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.count(
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: .70,
                            scrollDirection: Axis.vertical,
                            children: List.generate(
                              tools.toolsModel!.data!.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: productCard(context,
                                    image:
                                    '${tools.toolsModel!.data![index].imageUrl}',
                                    name: tools.toolsModel!.data![index].name,
                                    price: 5,
                                    numberForAddCart: 1),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
                //seeds.seedsModel == null
                /*tools.toolsModel == null
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: .70,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            tools.toolsModel!.data!.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: productCard(context,
                                  image:
                                      '${tools.toolsModel!.data![index].imageUrl}',
                                  name: tools.toolsModel!.data![index].name,
                                  price: 5,
                                  numberForAddCart: 1),
                            ),
                          ),
                        ),
                      ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
