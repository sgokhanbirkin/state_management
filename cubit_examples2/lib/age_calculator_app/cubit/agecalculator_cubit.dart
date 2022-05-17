import 'package:flutter_bloc/flutter_bloc.dart';

part 'agecalculator_state.dart';

class AgeCalculatorCubit extends Cubit<AgecalculatorInitial> {
  AgeCalculatorCubit() : super(AgecalculatorInitial(stageOfLife: ':)'));

  void updateAgeVal(int ageVal) {
    emit(AgecalculatorInitial(stageOfLife: getStage(ageVal)));
  }

  String getStage(int ageVal) {
    if (ageVal == 0 && ageVal == 1) {
      return 'Infant';
    } else if (ageVal >= 2 && ageVal <= 4) {
      return 'Toddler';
    } else if (ageVal >= 5 && ageVal <= 12) {
      return 'Child';
    } else if (ageVal >= 13 && ageVal <= 19) {
      return 'Teen';
    } else if (ageVal >= 20 && ageVal <= 39) {
      return 'Adult';
    } else if (ageVal >= 40 && ageVal <= 59) {
      return 'Middle-Aged';
    } else if (ageVal >= 60 && ageVal <= 79) {
      return 'Senior';
    } else if (ageVal >= 80) {
      return 'Elderly';
    } else {
      return 'Invalid';
    }
  }
}
