import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Shared/Constant/images.dart';
import '../../../Shared/Cubit/states.dart';
import '../Registration/components.dart';

Widget customCardForProfile({String? text, VoidCallback? onTap}) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black.withOpacity(.19), width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: const Color.fromRGBO(108, 108, 108, .1),
    elevation: 30,
    child: Center(
      child: ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(29, 89, 44, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Image.asset(
                '${imageAsset}change.png',
                width: 15,
              ),
            ),
          ),
        ),
        title: Text(
          'Change $text',
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward_sharp,
          color: Color.fromRGBO(29, 89, 44, 1),
          size: 30,
        ),
      ),
    ),
  );
}

void customAlertDialog(BuildContext context,
    {required String? title,
    required GlobalKey<FormState> formKey,
    required TextEditingController controller,
    required bool loading}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Change $title'),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        isPassword: false,
                        controller: controller,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your $title';
                          }
                          return null;
                        },
                        title: 'New $title',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
           loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () {
                      /*if (formKey.currentState!
                                                .validate()) {
                                              user.patchUserData(
                                                  firstName: textEditingController.text,
                                                  lastName: '',
                                                  address: user.userModel!.data!.address,
                                                  email: user.userModel!.data!.email,
                                                  method: 'me');
                                            }*/
                    },
                    child: const Text('Change')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cansel'),
            ),
          ],
        );
      });
}
