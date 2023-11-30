import 'package:my_app/bmi_calculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/calculator_states.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(InitialStates());

  int weightCounter = 50;
  int heightCounter = 150;
  double result = 0;

  String bmiState = 'Normal';
  double bmi = 0;

  //Height Functions
  void addHeight() {
    heightCounter++;
    emit(UpdateStates());
  }

  void minusHeight() {
    if (heightCounter > 0) {
      heightCounter--;
      emit(UpdateStates());
    }
  }

  //Weight Functions
  void addWeight() {
    weightCounter++;
    emit(UpdateStates());
  }

  void minusWeight() {
    weightCounter--;
    emit(UpdateStates());
  }

  String calculateBMI() {
    bmi = BMICalculator.calculateBMI(weightCounter, heightCounter);
    bmiState = BMICalculator.determineBMIState(bmi);
    result = double.parse(bmi.toStringAsFixed(1));
    emit(UpdateStates());
    return result.toString();
  }
}
