import 'package:flutter/material.dart';
import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/text.dart';
import '../../Components/custom_card.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomCard(
        imageUrl: "https://lavie.orangedigitalcenteregypt.com",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cactus plant',
              style: textStyle(
                size: 18,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '200 EGP',
              style: textStyle(
                size: 15,
                weight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 248, 248, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //clipBehavior: Clip.hardEdge,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.remove,
                            color: primaryColor,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '1',
                          style: textStyle(
                            size: 13,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: primaryColor,
                      size: 28,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
