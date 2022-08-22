import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Local/cash_helper.dart';
import 'package:la_vie/presentation/screens/Forum/forum_screen.dart';

import '../../../Shared/Constant/colors.dart';
import '../Exam/qustion_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.isSearchOnly = true}) : super(key: key);
  final bool? isSearchOnly;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeedsCubit, SeedsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
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
                                builder: (context) => const ForumScreen(),
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
