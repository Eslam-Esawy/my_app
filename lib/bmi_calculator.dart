import 'package:my_app/first_screen.dart';

class BMICalculator extends FirstScreen {
  static calculateBMI(int weightCounter, int heightCounter) {
    double heightInMeters = heightCounter / 100.0;
    return weightCounter / (heightInMeters * heightInMeters);
  }

  static String determineBMIState(double bmi) {
    if (bmi < 16) {
      return 'Severe Thinness';
    } else if (bmi > 16 && bmi <= 17) {
      return 'Moderate Thinness';
    } else if (bmi > 17 && bmi <= 18.5) {
      return 'Mild Thinness';
    } else if (bmi > 18.5 && bmi <= 25) {
      return 'Normal';
    } else if (bmi > 25 && bmi <= 30) {
      return 'Overweight';
    } else if (bmi > 30 && bmi <= 35) {
      return 'Obese Class I';
    } else if (bmi > 35 && bmi <= 40) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }
}
