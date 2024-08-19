import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/bmi_logic.dart';
import '../utils/constants.dart';
import 'generic_widgets/main_container.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  double height;
  int age;
  int weight;
  Gender gender;
  ResultPage(
      {required this.height,
        required this.age,
        required this.weight,
        required this.gender});

  BMI bmi = BMI();

  @override
  Widget build(BuildContext context) {
    bmi.calculateBMI(weight, height);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        /* leading: IconButton(
          icon:Icon(Icons.arrow_back,
          color: Colors.white,),
          onPressed: (){

          },
        ),*/
        foregroundColor: Colors.white,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //undo (Ctrl+z) redo (Ctrl+y)
                  Text(
                    'Your Result',
                    style: kNumberTextStyle.copyWith(fontSize: 45),
                  ),
                  Expanded(
                    child: MainContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            bmi.bmiStatueText(),
                            style: TextStyle(
                                color: bmi.bmiStatueColor(),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${bmi.bmiIndex!.toStringAsFixed(2)}',
                            style: kNumberTextStyle.copyWith(fontSize: 100),
                          ),
                          Column(
                            children: [
                              Text(
                                'Normal BMI range:',
                                style: kTitleTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '18.5 - 25 kg/m2',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              bmi.bmiAdviceText(),
                              style:
                              TextStyle(fontSize: 22, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            minWidth: double.infinity,
            height: 65,
            color: Colors.pink,
            child: Text(
              'RE-CALCULATE YOUR BMI',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
