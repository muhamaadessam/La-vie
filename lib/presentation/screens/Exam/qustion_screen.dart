import 'package:flutter/material.dart';
import 'package:la_vie/Shared/Constant/colors.dart';
import 'package:la_vie/Shared/Constant/text.dart';
import 'package:la_vie/presentation/screens/Exam/choies.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

int questionNumber = 1;
//bool isChoose = false;
List<bool> isChoose = [
  false,
  false,
  false,
];

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> answers = [
      'The user experience is how the developer feels about a user.',
      'The user experience is how the user feels about interacting with or experiencing aproduct.',
      'The user experience is the attitude the UX designer has about a product.',
    ];
//questionNumber=1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Container(),
        title: Text('Course Exam',
            style: textStyle(size: 19, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Question',
                  style: textStyle(
                    size: 36,
                    color: const Color(0xff3A3A3A),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '$questionNumber',
                  style: textStyle(size: 36, color: primaryColor),
                ),
                Text(
                  '/10',
                  style: textStyle(
                      size: 15, color: const Color.fromRGBO(151, 151, 151, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'What is the user experience?',
              style: textStyle(
                size: 20,
                weight: FontWeight.w600,
                color: const Color(0xff3A3A3A),
              ),
            ),
            const SizedBox(
              height: 52,
            ),
            OneChoose(
              answer: answers[0],
              isChoose: isChoose[0],
              function: () {
                setState(() {
                  //isChoose? false:true;

                  if (isChoose[0]) {
                    isChoose[0] = false;
                  } else {
                    isChoose[1] = isChoose[2] = false;
                    isChoose[0] = true;
                  }
                });
              },
            ),
            const SizedBox(
              height: 36,
            ),
            OneChoose(
              answer: answers[1],
              isChoose: isChoose[1],
              function: () {
                setState(() {
                  //isChoose? false:true;

                  if (isChoose[1]) {
                    isChoose[1] = false;
                  } else {
                    isChoose[0] = isChoose[2] = false;
                    isChoose[1] = true;
                  }
                });
              },
            ),
            const SizedBox(
              height: 36,
            ),
            OneChoose(
              answer: answers[2],
              isChoose: isChoose[2],
              function: () {
                setState(() {
                  //isChoose? false:true;

                  if (isChoose[2]) {
                    isChoose[2] = false;
                  } else {
                    isChoose[0] = isChoose[1] = false;
                    isChoose[2] = true;
                  }
                });
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                questionNumber == 1
                    ? Expanded(flex: 4,child: Container(),)
                    : Expanded(flex: 4,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                            side: BorderSide(
                              color: primaryColor,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (1 < questionNumber && questionNumber <= 10) {
                              setState(() {
                                questionNumber--;
                              });
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Center(
                              child: Text(
                                'Back',
                                style: textStyle(color: primaryColor, size: 16),
                              ),
                            ),
                          )),
                    ),
                const Expanded(flex:1,child: SizedBox()),
                Expanded(flex: 4,
                  child: ElevatedButton(
                    onPressed: () {
                      if (questionNumber < 10) questionNumber++;
                      if (questionNumber == 10) Navigator.pop(context);
                      setState(() {});
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Center(
                        child: Text(
                          questionNumber != 10 ? 'Next' : 'Finish',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
