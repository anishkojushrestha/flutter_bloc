part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishActionState extends WishlistState {}

class WishSuccessState extends WishlistState {
  final List<HomeModels> homeModels;

  WishSuccessState({required this.homeModels});
}

class WishlistInitial extends WishlistState {}
