import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final Widget? child;
  const LoginBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/image_68_top.png',
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset('assets/images/image_68_pottom.png'),
              ),
              child!,
            ]
        ),
      ),
    );
  }
}