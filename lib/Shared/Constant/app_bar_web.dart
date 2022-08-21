import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/images.dart';

class WebBar extends StatelessWidget {
  const WebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 96),
      child: Row(
        children: [
          Image.asset(
            '${imageAsset}Logo.png',
            height: 32,
          ),
          const Spacer(
            flex: 3,
          ),
          TextButton(onPressed: () {}, child: const Text('data')),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('data')),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('data')),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('data')),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text('data')),
          const Spacer(
            flex: 3,
          ),
          Container(
            height: 16,
            width: 16,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
