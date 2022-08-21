import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/presentation/screens/Forum/create_new_post.dart';
import 'package:la_vie/presentation/screens/Forum/post.dart';
import 'package:la_vie/presentation/screens/HomeScreen/search_bar.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController listScrollController = ScrollController();
    ScrollController singleScrollController = ScrollController();
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePost(),
              ),
            );
          },
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Discussion Forums',
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
        controller: singleScrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SearchBar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('object');
                        },
                        style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'All Forum',
                            style: textStyle(
                              color: Colors.white,
                              weight: FontWeight.w500,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.resolveWith(
                              (states) => BorderSide(
                                color: Colors.black.withOpacity(.13),
                              ),
                            ),
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 0),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                          ),
                          onPressed: () {
                            print('object');
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'My Forums',
                              style: textStyle(
                                color: Colors.grey[400],
                                weight: FontWeight.w500,
                                size: 12,
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        controller: listScrollController,
                        itemBuilder: (context, index) => const Post(),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
