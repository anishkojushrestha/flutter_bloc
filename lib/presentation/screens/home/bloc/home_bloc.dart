import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCardButtonNavigateEvent>(homeCardButtonNavigateEvent);
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("wishlist button navigated");
    emit(HomeNavigatetoWishListPageActionState());
  }

  FutureOr<void> homeCardButtonNavigateEvent(
      HomeCardButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint("Going to card");
    emit(HomeNavigatetoCardListPageActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2)); //
    emit(HomeLoadedSuccessState());
  }
}
