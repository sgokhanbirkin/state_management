part of 'sample_cubit.dart';

@immutable
abstract class SampleState {
  const SampleState();
}

class SampleInitial extends SampleState {
  const SampleInitial();
}

class SampleLoading extends SampleState {
  const SampleLoading();
}

class SampleLoaded extends SampleState {
  final String data;

  const SampleLoaded(this.data);
}

class SampleError extends SampleState {
  const SampleError();
}
