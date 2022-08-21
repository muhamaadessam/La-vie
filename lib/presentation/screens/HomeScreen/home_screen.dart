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
    HomeTapsCubit? tabs = HomeTapsCubit.get(context);
    //print('plants data: ${plants.plantsModel!.data![0].description.toString()}');
    List<String> tabsTitles = ['All', 'Plants', 'Seeds', 'Tools'];
    ScrollController scrollController = ScrollController();
    return BlocConsumer<HomeTapsCubit, HomeTabsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => BlocConsumer<SeedsCubit, SeedsStates>(
        listener: (context, state) => () {},
        builder: (context, state) =>
            BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) => () {},
          builder: (context, state) => DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                //leading: Container(),
                leadingWidth: 0,
                elevation: 0,
                title: SizedBox(
                  height: 45,
                  child: Image.asset(
                    'assets/images/Logo.png',
                  ),
                ),
              ),
              body: Column(
                children: [
                  const SearchBar(
                    isSearchOnly: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: ListView.separated(
                          shrinkWrap: true,
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => customHomeTab(
                                text: tabsTitles[index],
                                textStyle: tabs.index == index
                                    ? tabs.textStyle
                                    : GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: const Color.fromRGBO(
                                            151, 151, 151, 1),
                                      ),
                                buttonStyle: tabs.index == index
                                    ? tabs.buttonStyle
                                    : ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.resolveWith(
                                                (states) => 0),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) => const Color.fromRGBO(
                                              248, 248, 248, 1),
                                        ),
                                      ),
                                onTab: () {
                                  tabs.changeTab(index);
                                },
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 16,
                              ),
                          itemCount: tabsTitles.length),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          child: tabs.index == 0
                              ? (products.productsModel == null
                                  ? const Center(
                                      child: CircularProgressIndicator())
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
                                              name: products.productsModel!
                                                  .data![index].name,
                                              price: 5,
                                              numberForAddCart: 1),
                                        ),
                                      ),
                                    ))
                              : (tabs.index == 1
                                  ? (plants.plantsModel == null
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : GridView.count(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          crossAxisCount: 2,
                                          childAspectRatio: .70,
                                          scrollDirection: Axis.vertical,
                                          children: List.generate(
                                            plants.plantsModel!.data!.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: productCard(context,
                                                  image:
                                                      '${plants.plantsModel!.data![index].imageUrl}',
                                                  name: plants.plantsModel!
                                                      .data![index].name,
                                                  price: 5,
                                                  numberForAddCart: 1),
                                            ),
                                          ),
                                        ))
                                  : (tabs.index == 2
                                      ? (seeds.seedsModel == null
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : GridView.count(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              crossAxisCount: 2,
                                              childAspectRatio: .70,
                                              scrollDirection: Axis.vertical,
                                              children: List.generate(
                                                seeds.seedsModel!.data!.length,
                                                (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: productCard(context,
                                                      image:
                                                          '${seeds.seedsModel!.data![index].imageUrl}',
                                                      name: seeds.seedsModel!
                                                          .data![index].name,
                                                      price: 5,
                                                      numberForAddCart: 1),
                                                ),
                                              ),
                                            ))
                                      : (tools.toolsModel == null
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : GridView.count(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              crossAxisCount: 2,
                                              childAspectRatio: .70,
                                              scrollDirection: Axis.vertical,
                                              children: List.generate(
                                                tools.toolsModel!.data!.length,
                                                (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: productCard(context,
                                                      image:
                                                          '${tools.toolsModel!.data![index].imageUrl}',
                                                      name: tools.toolsModel!
                                                          .data![index].name,
                                                      price: 5,
                                                      numberForAddCart: 1),
                                                ),
                                              ),
                                            )))))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
