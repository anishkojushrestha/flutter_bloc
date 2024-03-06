import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:simplecardbloc/data/card_item.dart';
import 'package:simplecardbloc/data/data.dart';
import 'package:simplecardbloc/data/wistlist_item.dart';
import 'package:simplecardbloc/presentation/screens/home/home_models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCardButtonNavigateEvent>(homeCardButtonNavigateEvent);
    on<HomeProductWishListButtonClickEvent>(
        homeProductWishListButtonClickEvent);
    on<HomeProductCardButtonClickEvent>(homeProductCardButtonClickEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2)); //
    emit(HomeLoadedSuccessState(
        productList: Data.product
            .map((e) => HomeModels(
                id: e['id'],
                name: e['name'],
                desc: e['desc'],
                price: e['price'],
                img: e['img']))
            .toList()));
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

  FutureOr<void> homeProductWishListButtonClickEvent(
      HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    wishListItem.add(event.homeModels);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCardButtonClickEvent(
      HomeProductCardButtonClickEvent event, Emitter<HomeState> emit) {
    cardItemList.add(event.homeModels);
    emit(HomeProductItemCardListedActionState());
  }
}
