import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/calculator_states.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(InitialStates());

  int weightCounter = 50;
  int heightCounter = 150;
  double result = 0;
}
