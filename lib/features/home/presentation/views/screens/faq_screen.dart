


import 'package:chef_app/core/widgets/custom_body_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../components/questions_container_item.dart';

class FaqScreen extends StatefulWidget {

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {


  List<bool>pressed=[
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
                padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
                child: Column(
                  children: [
                    QuestionsContainerItem(
                      text: S.of(context).faq1,
                      onTap: () {
                        setState(() {
                          pressed[0] = !pressed[0];
                        });
                      },
                      isPressed: pressed[0],
                      answerText: S.of(context).faqanswer1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    QuestionsContainerItem(
                      text: S.of(context).faq2,
                      onTap: () {
                        setState(
                              () {
                                pressed[1] = !pressed[1];
                          },
                        );
                      },
                      isPressed: pressed[1],
                      answerText: S.of(context).faqanswer2,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq3,
                      onTap: () {
                        setState(
                              () {
                                pressed[2] = !pressed[2];
                          },
                        );
                      },
                      isPressed: pressed[2],
                      answerText: S.of(context).faqanswer3,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq4,
                      onTap: () {
                        setState(
                              () {
                                pressed[3] = !pressed[3];
                          },
                        );
                      },
                      isPressed: pressed[3],
                      answerText: S.of(context).faqanswer4,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq5,
                      onTap: () {
                        setState(
                              () {
                                pressed[4] = !pressed[4];
                          },
                        );
                      },
                      isPressed: pressed[4],
                      answerText: S.of(context).faqanswer5,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq6,
                      onTap: () {
                        setState(
                              () {
                                pressed[5] = !pressed[5];
                          },
                        );
                      },
                      isPressed: pressed[5],
                      answerText: S.of(context).faqanswer6,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq7,
                      onTap: () {
                        setState(
                              () {
                                pressed[6] = !pressed[6];
                          },
                        );
                      },
                      isPressed: pressed[6],
                      answerText: S.of(context).faqanswer7,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq8,
                      onTap: () {
                        setState(
                              () {
                                pressed[7] = !pressed[7];
                          },
                        );
                      },
                      isPressed: pressed[7],
                      answerText: S.of(context).faqanswer8,

                    ),
                    SizedBox(
                      height: 20,
                    ),

                    QuestionsContainerItem(
                      text: S.of(context).faq9,
                      onTap: () {
                        setState(
                              () {
                                pressed[8] = !pressed[8];
                          },
                        );
                      },
                      isPressed: pressed[8],
                      answerText: S.of(context).faqanswer9,

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
