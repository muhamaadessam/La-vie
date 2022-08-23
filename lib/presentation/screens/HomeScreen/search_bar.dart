import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'package:la_vie/presentation/screens/Forum/forum_screen.dart';
import 'package:la_vie/presentation/screens/MyCart/my_cart_screen.dart';

import '../../../Shared/Constant/colors.dart';
import '../Exam/qustion_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.isSearchOnly = true, this.forumsCubit})
      : super(key: key);
  final bool? isSearchOnly;
  final ForumsCubit? forumsCubit;

  @override
  Widget build(BuildContext context) {
    var list = ProductsCubit.get(context).search;
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {
                  //for(SeedsCubit.get(context).seedsModel!.data!.length!);
                  /*for (var element in ProductsCubit.get(context).productsModel!.data![0].name!) {
                    ProductsCubit.get(context).getSearch(element.name);
                  }*/
                  for (int i = 0;
                      ProductsCubit.get(context).productsModel!.data!.length >
                          i;
                      i++) {
                    ProductsCubit.get(context).getSearch(
                        ProductsCubit.get(context)
                            .productsModel!
                            .data![i]
                            .name);
                    debugPrint(list.toString());
                  }
                  //debugPrint(list);
                  debugPrint(value.toString());
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  fillColor: const Color.fromRGBO(248, 248, 248, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            isSearchOnly!
                ? Container()
                : Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        //height: 48,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyCartScreen(),
                              ),
                            );
                          },
                          icon: Image.asset('assets/images/Cart.png'),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
