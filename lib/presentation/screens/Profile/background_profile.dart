import 'package:flutter/material.dart';

import '../../../Shared/Constant/images.dart';

class BackgroundProfile extends StatelessWidget {
  const BackgroundProfile({Key? key, required this.children}) : super(key: key);

  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            '${imageAsset}profile.png',
          ),
        ),
        Container(
          color: Colors.black.withOpacity(.6),
          width: double.infinity,
          height: double.infinity,
        ),
        children,
      ],
    );
  }
}
