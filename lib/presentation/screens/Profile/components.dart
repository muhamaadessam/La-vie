import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';

import '../../../Shared/Constant/images.dart';
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


void changeEmailAlertDialog(BuildContext context,
    {required String? title,
    required UserCubit user,
    required String? address,
    required String? firstName,
    required String? lastName,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
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
                  const Text('Change Email'),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        isPassword: false,
                        controller: emailController,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        title: 'New Email',
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
                      if (formKey.currentState!.validate()) {
                        user.patchUserData(
                            email: emailController.text,
                            firstName: firstName,
                            lastName: lastName,
                            address: address);
                      }
                      user.getUserData();
                      debugPrint('Email ${emailController.text}');
                      Navigator.pop(context);
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

void changeNameAlertDialog(BuildContext context,
    {required String? title,
    required UserCubit user,
    required String? address,
    required String? email,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
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
                  const Text('Change Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        isPassword: false,
                        controller:
                             nameController ,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        title: 'New Name',
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
                      if (formKey.currentState!.validate()) {
                        var name = nameController.text.split(' ');
                        user.patchUserData(
                            email: email,
                            firstName: name[0],
                            lastName: name[1],
                            address: address);
                        user.getUserData();
                        debugPrint('Name $name');
                        Navigator.pop(context);
                      }
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
