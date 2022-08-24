import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/presentation/Components/navigation_bar.dart';
import 'package:la_vie/presentation/screens/ProductScreen/productScreen.dart';

import '../../../Shared/Cubit/states.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit qr = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) => {
        if (state is QRErrorState)
          {
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0),
          }
      },
      builder: (context, states) => Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                qr.scanQR(context);
                //CircularProgressIndicator();
              },
              child: const Text('Start QR scan'),
            ),
          ],
        ),
      ),
    );
  }
}
