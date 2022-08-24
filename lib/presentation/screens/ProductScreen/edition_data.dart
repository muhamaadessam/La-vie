import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Shared/Constant/images.dart';

class RowEditionData extends StatelessWidget {
  const RowEditionData({Key? key, required this.image, required this.title, required this.result}) : super(key: key);
  final String? image;
  final String? title;
  final String? result;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.64),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('$imageAsset$image'),
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      result!,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Text(
                  title== 'Temperature'?"0 ":'%',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize:  title== 'Temperature'?12:16,
                  ),
                ),
                title== 'Temperature'?Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'C',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ):Container(),
              ],
            ),
            Text(
              title!,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
