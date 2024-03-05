part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickEvent extends HomeEvent {}

class HomeProductCardButtonClickEvent extends HomeEvent {}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCardButtonNavigateEvent extends HomeEvent {}
