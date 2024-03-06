part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishinitialEvent extends WishlistEvent {}

class WishRemoveEvent extends WishlistEvent {
  final HomeModels homeModels;

  WishRemoveEvent({required this.homeModels});
}
