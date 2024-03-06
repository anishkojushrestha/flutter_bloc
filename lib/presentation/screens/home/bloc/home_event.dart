part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {
  final HomeModels homeModels;

  HomeProductWishListButtonClickEvent({required this.homeModels});
}

class HomeProductCardButtonClickEvent extends HomeEvent {
  final HomeModels homeModels;

  HomeProductCardButtonClickEvent({required this.homeModels});
}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCardButtonNavigateEvent extends HomeEvent {}
