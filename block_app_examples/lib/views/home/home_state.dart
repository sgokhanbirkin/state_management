// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class HomeState extends Equatable {
  final HomeTab tab;

  const HomeState({
    this.tab = HomeTab.home,
  });

  @override
  List<Object?> get props => [tab];
}

enum HomeTab {
  home,
  settings,
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setTab(HomeTab tab) => emit(HomeState(tab: tab));

  void changeTab(HomeTab tab) {
    emit(HomeState(tab: tab));
  }
}
