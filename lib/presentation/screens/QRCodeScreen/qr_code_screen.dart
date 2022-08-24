import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      listener: (context, states) => {},
      builder: (context, states) => Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                qr.scanQR();
                //states is QRLoadingState ||qr.plantsModel!.data!.isEmpty ?const CircularProgressIndicator() :
                showDialog(
                    context: context,
                    builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                              right: 50, left: 50, top: 640, bottom: 150),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //  qr.plantsModel!.data!.isEmpty ?const CircularProgressIndicator() :
                                      Text(
                                        '${qr.plantsModel!.data!.first.name}',
                                        style: textStyle(
                                          color: Colors.black,
                                          size: 16,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      //  (qr.plantsModel!.data!.isEmpty) ?const CircularProgressIndicator() :
                                      Text(
                                        '${qr.plantsModel!.data![0].description}',
                                        style: textStyle(
                                          color: Colors.black,
                                          size: 14,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                            name: qr
                                                .plantsModel!.data!.first.name!,
                                            description: qr.plantsModel!.data!
                                                .first.description!,
                                            imageUrl: qr.plantsModel!.data!
                                                .first.imageUrl!,
                                            waterCapacity: qr.plantsModel!.data!
                                                .first.waterCapacity!,
                                            sunLight: qr.plantsModel!.data!
                                                .first.sunLight!,
                                            temperature: qr.plantsModel!.data!
                                                .first.temperature!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
              },
              child: const Text('Start QR scan'),
            ),
          ],
        ),
      ),
    );
  }
}
