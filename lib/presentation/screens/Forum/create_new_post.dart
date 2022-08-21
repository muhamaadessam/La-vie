import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/presentation/screens/Registration/components.dart';

import '../../../Shared/Constant/colors.dart';
import '../../../Shared/Constant/text.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    var formKey = GlobalKey<FormState>();
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
                child: TextButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
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
                                  const Text('Upload Photo'),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            final XFile? image =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            print('image : ${image!.path.toString()}');
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                              'Upload from Gallery')),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final XFile? image =
                                              await picker.pickImage(
                                                  source: ImageSource.camera);
                                          print('image : ${image!.path.toString()}');
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Take New Picture'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
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
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Post')))
            ],
          ),
        ),
      ),
    );
  }
}
