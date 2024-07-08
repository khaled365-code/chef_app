




import 'package:chef_app/core/widgets/custom_body_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/questions_container_item.dart';

class PrivacyPolicyScreen extends StatefulWidget {

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

   List<bool> pressed=[
     false,
     false,
     false,
     false,
     false,
     false,
     false,
     false,
     false,
   ];



   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomBodyBar(
                bodyBarHeight: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  [
                    QuestionsContainerItem(
                      text: S.of(context).question1,
                      onTap: () {
                        setState(() {
                          pressed[0] = !pressed[0];
                        });
                      },
                      isPressed: pressed[0],
                      answerText: S.of(context).answer1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question2,
                      onTap: () {
                        setState(
                          () {
                            pressed[1] = !pressed[1];
                          },
                        );
                      },
                      isPressed: pressed[1],
                      answerText: S.of(context).answer2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question3,
                      onTap: () {
                        setState(
                          () {
                            pressed[2] = !pressed[2];
                          },
                        );
                      },
                      isPressed: pressed[2],
                      answerText: S.of(context).answer3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question4,
                      onTap: () {
                        setState(
                          () {
                            pressed[3] = !pressed[3];
                          },
                        );
                      },
                      isPressed: pressed[3],
                      answerText: S.of(context).answer4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question5,
                      onTap: () {
                        setState(
                          () {
                            pressed[4] = !pressed[4];
                          },
                        );
                      },
                      isPressed: pressed[4],
                      answerText: S.of(context).answer5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question6,
                      onTap: () {
                        setState(
                          () {
                            pressed[5] = !pressed[5];
                          },
                        );
                      },
                      isPressed: pressed[5],
                      answerText: S.of(context).answer6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question7,
                      onTap: () {
                        setState(
                          () {
                            pressed[6] = !pressed[6];
                          },
                        );
                      },
                      isPressed: pressed[6],
                      answerText: S.of(context).answer7,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question8,
                      onTap: () {
                        setState(
                          () {
                            pressed[7] = !pressed[7];
                          },
                        );
                      },
                      isPressed: pressed[7],
                      answerText: S.of(context).answer8,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).question9,
                      onTap: () {
                        setState(
                          () {
                            pressed[8] = !pressed[8];
                          },
                        );
                      },
                      isPressed: pressed[8],
                      answerText: S.of(context).answer9,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


