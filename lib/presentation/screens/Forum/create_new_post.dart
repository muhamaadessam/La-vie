import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/presentation/screens/Registration/components.dart';
import 'dart:io';

import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/text.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForumsCubit forums = ForumsCubit.get(context);
/*
    Future<ImageSource?> showImageSource(context) async {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: primaryColor,
                ),
                title: Text(
                  'Camera',
                  style: textStyle(color: Colors.black),
                ),
                onTap: () {
                  forums.pickImage(ImageSource.camera);
                  Navigator.of(context).pop(ImageSource.camera);
                }),
            ListTile(
                leading: Icon(
                  Icons.image,
                  color: primaryColor,
                ),
                title: Text(
                  'Gallery',
                  style: textStyle(color: Colors.black),
                ),
                onTap: () {
                  forums.pickImage(ImageSource.gallery);
                  Navigator.of(context).pop(ImageSource.camera);
                }),
          ],
        ),
      );
    }
*/
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) => () {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Create New Post',
            style: textStyle(
                color: Colors.black, weight: FontWeight.w700, size: 21),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  forums.image != null
                      ? InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.file(
                              forums.image!,
                              height: 300,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          onTap: () async {
                            final source =
                                await forums.showImageSource(context);
                            if (source == null) return;
                            debugPrint('Source : $source');
                          },
                        )
                      : Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              final source =
                                  await forums.showImageSource(context);
                              if (source == null) return;
                              // Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: 17,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Add Photo',
                                  style: textStyle(
                                      color: primaryColor,
                                      weight: FontWeight.w400,
                                      size: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                      title: 'Title',
                      isPassword: false,
                      controller: title,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Title';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      title: 'Description',
                      isPassword: false,
                      controller: description,
                      keyboardType: TextInputType.multiline,
                      maxLine: 5,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Description';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final Uint8List bytes = File(forums.image!.path).readAsBytesSync();
                              // base64Encode(bytes); will bass to API
                              forums.forumsAddPost(
                                title: title.text,
                                description: description.text,
                                imageBase64: base64Encode(bytes),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Post')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
