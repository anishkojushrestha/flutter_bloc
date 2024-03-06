part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<HomeModels> productList;

  HomeLoadedSuccessState({required this.productList});
}

class HomeErrorState extends HomeState {}

class HomeNavigatetoWishListPageActionState extends HomeActionState {}

class HomeNavigatetoCardListPageActionState extends HomeActionState {}

class HomeProductItemWishListedActionState extends HomeActionState {}

class HomeProductItemCardListedActionState extends HomeActionState {}
