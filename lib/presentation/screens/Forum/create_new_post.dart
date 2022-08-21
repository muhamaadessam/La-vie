import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/Registration/components.dart';

import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/text.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create New Post',
          style:
              textStyle(color: Colors.black, weight: FontWeight.w700, size: 21),
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
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: primaryColor,
                    width: 1,
                  ),
                ),
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
              const SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                  title: 'Title',
                  isPassword: false,
                  controller: title,
                  validation: (value) {
                    return 'null';
                  }),
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  title: 'Description',
                  isPassword: false,
                  controller: description,
                  maxLine: 5,
                  validation: (value) {
                    return 'null';
                  }),
              const SizedBox(
                height: 32,
              ),
              SizedBox(width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text('Post')))
            ],
          ),
        ),
      ),
    );
  }
}
