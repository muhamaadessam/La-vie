import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Shared/Constant/images.dart';
import '../../../Shared/Constant/text.dart';

class NotificationDesign extends StatelessWidget {
  const NotificationDesign(
      {Key? key,
      required this.message,
      required this.createAt,
      required this.imageUrl})
      : super(key: key);
  final String? message;
  final String? createAt;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    imageUrl != 'https://lavie.orangedigitalcenteregypt.com'
        ? imageProvider = NetworkImage(imageUrl!)
        : imageProvider = AssetImage('${imageAsset}profile.png');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: imageProvider,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  //user.userModel!.data!.userNotification![0].message!,
                  message!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 14, color: const Color.fromRGBO(26, 31, 54, 1)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  createAt!,
                  style: textStyle(
                    weight: FontWeight.w400,
                    size: 14,
                    color: const Color.fromRGBO(165, 172, 184, 1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
