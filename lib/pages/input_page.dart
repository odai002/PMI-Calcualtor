import 'package:bmi/pages/result_page.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'generic_widgets/icon_with_text_widget.dart';
import 'generic_widgets/increment_decrement_widget.dart';
import 'generic_widgets/main_container.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 183;
  int weight = 74;
  int age = 19;
  Gender? gender;

  Color femaleColor = kGreyColor;
  Color maleColor = kGreyColor;

  // String text() => 'AAA';

  // String text2() {
  //   return 'AAA';
  // }

  void genderSelect(Gender genderTemp) {
    if (genderTemp == Gender.male) {
      maleColor = Colors.white;
      femaleColor = kGreyColor;
      gender = Gender.male;
      setState(() {});
    } else {
      maleColor = kGreyColor;
      femaleColor = Colors.white;
      gender = Gender.female;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              genderSelect(Gender.male);
                            },
                            child: MainContainer(
                              child: IconWithTextWidget(
                                icon: Icons.male,
                                text: 'MALE',
                                color: maleColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              genderSelect(Gender.female);
                            },
                            child: MainContainer(
                              child: IconWithTextWidget(
                                icon: Icons.female,
                                text: 'FEMALE',
                                color: femaleColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: MainContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kTitleTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${height.floor()}',
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style:
                                TextStyle(color: kGreyColor, fontSize: 22),
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                                thumbColor: Colors.pink,
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: kGreyColor,
                                trackHeight: 1,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayColor: Colors.pink.withOpacity(0.15)),
                            child: Slider(
                              value: height,
                              onChanged: (value) {
                                setState(() {});
                                height = value;
                                // print(value);
                              },
                              min: 80,
                              max: 220,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: MainContainer(
                            child: IncrementDecrementWidget(
                                title: 'WEIGHT',
                                number: '$weight',
                                decrement: () {
                                  if (weight == 10) return;
                                  weight--;
                                  setState(() {});
                                },
                                increment: () {
                                  if (weight == 180) return;
                                  weight++;
                                  setState(() {});
                                }),
                          ),
                        ),
                        Expanded(
                          child: MainContainer(
                            child: IncrementDecrementWidget(
                                title: 'AGE',
                                number: '$age',
                                decrement: () {
                                  if (age == 5) return;
                                  age--;
                                  setState(() {});
                                },
                                increment: () {
                                  if (age == 100) return;
                                  age++;
                                  setState(() {});
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ResultPage(
                    height: height,
                    gender: gender ?? Gender.male,
                    weight: weight,
                    age: age,
                  )));
            },
            minWidth: double.infinity,
            height: 65,
            color: Colors.pink,
            child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

enum Gender { male, female }
