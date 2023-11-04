import 'bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

int weightCounter = 50;
int heightCounter = 150;
double result = 0;
String state = 'Normal';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 4, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 4, 31),
        title: const Text(
          'BMI Calculator App',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Containers
                //......................................

                //Container
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 23, 39),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$weightCounter',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          const Text(
                            'KG',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.grey[700],
                            onPressed: () {
                              setState(() {
                                weightCounter++;
                              });
                              if (kDebugMode) {
                                '$weightCounter';
                              }
                            },
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.grey[700],
                            onPressed: () {
                              setState(() {
                                if (weightCounter > 0) {
                                  weightCounter--;
                                }
                              });
                              if (kDebugMode) {
                                '$weightCounter';
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                // Container 2

                Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 23, 39),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$heightCounter',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          ),
                          const Text(
                            'CM',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.grey[700],
                            onPressed: () {
                              setState(() {
                                heightCounter++;
                              });
                              if (kDebugMode) {
                                '$heightCounter';
                              }
                            },
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.grey[700],
                            onPressed: () {
                              setState(() {
                                if (heightCounter > 0) {
                                  heightCounter--;
                                }
                              });
                              if (kDebugMode) {
                                '$heightCounter';
                              }
                            },
                            child: const Icon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                double bmi =
                    BMICalculator.calculateBMI(weightCounter, heightCounter);
                String bmiState = BMICalculator.determineBMIState(bmi);

                setState(() {
                  result = double.parse(bmi.toStringAsFixed(1));
                  state = bmiState;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 178, 6, 75),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),

            const SizedBox(
              height: 80,
            ),

            // The Result Area

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result : $result',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              state,
              style: TextStyle(
                // Color based on the state
                color: getColorForState(state),
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  getColorForState(String state) {
    switch (state) {
      case 'Moderate Thinness':
        return const Color.fromARGB(255, 169, 95, 72);
      case 'Mild Thinness':
        return const Color.fromARGB(255, 169, 95, 72);

      case 'Normal':
        return Colors.green;

      case 'Overweight':
        return const Color.fromARGB(255, 189, 83, 75);

      case 'Severe Thinness':
        return Colors.red;
      case 'Obese Class I':
        return Colors.red;
      case 'Obese Class II':
        return Colors.red;
      case 'Obese Class III':
        return Colors.red;

      default:
        return Colors.white; // Default color
    }
  }
}
