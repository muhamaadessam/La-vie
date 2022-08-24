import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/Forum/forum_screen.dart';
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
    List<String> tabsTitles = ['All', 'Plants', 'Seeds', 'Tools'];
    ScrollController scrollController = ScrollController();
    return BlocConsumer<HomeTapsCubit, HomeTabsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => BlocConsumer<PlantsCubit, PlantsStates>(
        listener: (context, state) => () {},
        builder: (context, state) => BlocConsumer<ToolsCubit, ToolsStates>(
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
                    leading: IconButton(
                      icon: Icon(
                        Icons.social_distance_rounded,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForumScreen()));
                      },
                    ),
                    //leadingWidth: 0,
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
                                            elevation: MaterialStateProperty
                                                .resolveWith((states) => 0),
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith(
                                              (states) => const Color.fromRGBO(
                                                  248, 248, 248, 1),
                                            ),
                                          ),
                                    onTab: () {
                                      tabs.changeTab(index);
                                    },
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 16,
                                  ),
                              itemCount: tabsTitles.length),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: tools.toolsModel == null ||
                                  plants.plantsModel == null ||
                                  seeds.seedsModel == null ||
                                  products.productsModel == null
                              ? const Center(child: CircularProgressIndicator())
                              : GridView.count(
                                  physics: const BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: .70,
                                  scrollDirection: Axis.vertical,
                                  children: List.generate(
                                    tabs.index == 0
                                        ? products.productsModel!.data!.length
                                        : (tabs.index == 1
                                            ? plants.plantsModel!.data!.length
                                            : (tabs.index == 2
                                                ? seeds.seedsModel!.data!.length
                                                : tools
                                                    .toolsModel!.data!.length)),
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ProductCard(
                                          index: tabs.index,
                                          image: tabs.index == 0
                                              ? '${products.productsModel!.data![index].imageUrl}'
                                              : (tabs.index == 1
                                                  ? '${plants.plantsModel!.data![index].imageUrl}'
                                                  : (tabs.index == 2
                                                      ? '${seeds.seedsModel!.data![index].imageUrl}'
                                                      : '${tools.toolsModel!.data![index].imageUrl}')),
                                          name: tabs.index == 0
                                              ? '${products.productsModel!.data![index].name}'
                                              : (tabs.index == 1
                                                  ? '${plants.plantsModel!.data![index].name}'
                                                  : (tabs.index == 2
                                                      ? '${seeds.seedsModel!.data![index].name}'
                                                      : '${tools.toolsModel!.data![index].name}')),
                                          price: 500,
                                          //numberForAddCart: 1,
                                          id: tabs.index == 0
                                              ? '${products.productsModel!.data![index].productId}'
                                              : (tabs.index == 1
                                                  ? '${plants.plantsModel!.data![index].plantId}'
                                                  : (tabs.index == 2
                                                      ? '${seeds.seedsModel!.data![index].seedId}'
                                                      : '${tools.toolsModel!.data![index].toolId}'))),
                                    ),
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
        ),
      ),
    );
  }
}

/*
*
* (tools.toolsModel == null
                                      ? const Center(
                                          child: CircularProgressIndicator())
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
                                              child: ProductCard(
                                                  index: index,
                                                  image:
                                                      '${tools.toolsModel!.data![index].imageUrl}',
                                                  name: tools.toolsModel!
                                                      .data![index].name,
                                                  price: 5,
                                                  //numberForAddCart: 1,
                                                  id: tools.toolsModel!
                                                      .data![index].toolId),
                                            ),
                                          ),
                                        ))
*
* */
