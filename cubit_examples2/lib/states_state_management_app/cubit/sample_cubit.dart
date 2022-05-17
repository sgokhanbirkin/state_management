import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  SampleCubit() : super(const SampleInitial());

  Future<void> displayData(String data) async {
    emit(const SampleLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      data.isNotEmpty ? emit(SampleLoaded(data)) : emit(const SampleError());
    });
  }

  Future<void> restartState() async {
    emit(const SampleLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      emit(const SampleInitial());
    });
  }
}
