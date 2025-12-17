import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/data/globals.dart';
import 'package:quiz_app/data/quiz_app_data.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class TopicsScreen extends StatelessWidget {
  TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Choose Topic',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    // Spacer(),
                    Container(
                      width: 135,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(32),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.person, size: 32),
                          Expanded(
                            child: Text(
                              userNameController.text,
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                // passing parameters using constructor

                // instance 1
                for (int i = 0; i < quizAppTopics.length; i++)
                  TopicCard(
                    title: quizAppTopics[i]['name'],
                    description: quizAppTopics[i]['description'],
                    iconPath: quizAppTopics[i]['iconPath'],
                    colorHex: quizAppTopics[i]['color'],
                    questions: quizAppTopics[i]['questions'],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  /// Constructor : is a function with the same name as the class
  /// constructor is used to initialize the properties of the class
  ///

  /* 
  Threre are two types of parameters in the constructor:
   1. Positional parameters: are defined without curly braces {} , and type their order only during sending them
   2. Named parameters: are defined with curly braces {}, and type their names during sending them
  */
  TopicCard({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.colorHex,
    required this.questions,
  });

  // variables
  String title;
  String description;
  String iconPath;
  int colorHex;
  List questions;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => QuizScreen(
              title: title,
              description: description,
              iconPath: iconPath,
              colorHex: colorHex,
              questions: questions,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(colorHex),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(iconPath),
            ),

            SizedBox(width: 16),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Color(0xFF666666)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            Icon((Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }
}
