import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie/Shared/Constant/images.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/Shared/Cubit/cubit.dart';
import 'package:la_vie/Shared/Cubit/states.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';
import 'package:la_vie/presentation/screens/Profile/background_profile.dart';
import 'package:la_vie/presentation/screens/Profile/components.dart';
import 'package:la_vie/presentation/screens/Registration/registrationScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit user = UserCubit.get(context);
    user.getUserData(method: 'me');
    //user.patchUserData(method: USER, email: 'email', firstName: 'll', lastName: 'ss', address: 'sssss');
    print(user.userModel!.data!.email);
    var formKey = GlobalKey<FormState>();
    TextEditingController textEditingController = TextEditingController();
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) => () {},
      builder: (context, state) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                user.patchUserData(method: USER, email: 'email', firstName: 'll', lastName: 'ss', address: 'sssss');
                //Navigator.pop(context);
              },
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: BackgroundProfile(
            children: SingleChildScrollView(
              child: Column(
         // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 96,
            ),
              CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage:
                    NetworkImage(user.userModel!.data!.imageUrl.toString()),
                radius: 75,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${user.userModel!.data!.firstName} ${user.userModel!.data!.lastName}',
                style: textStyle(
                    size: 25, weight: FontWeight.w700, color: Colors.white),
              ),
            const SizedBox(
              height: 40,
            ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*.61,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(243, 254, 241, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        height: 64,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                '${imageAsset}points.png',
                                height: 36,
                              ),
                            ),
                            Text(
                              'You have 30 points',
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Edit Profile',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      customCardForProfile(
                          text: 'Name',
                          onTap: () {
                            customAlertDialog(
                              context,
                              title: 'Name',
                              formKey: formKey,
                              controller: textEditingController,
                              loading: state is UserLoadingState,
                            );
                          }),
                      const SizedBox(
                        height: 32,
                      ),
                      customCardForProfile(
                          text: 'Email',
                          onTap: () {
                            customAlertDialog(
                              context,
                              title: 'Email',
                              formKey: formKey,
                              controller: textEditingController,
                              loading: state is UserLoadingState,
                            );
                          }),
                      const SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
            )),
      ),
    );
  }
}
