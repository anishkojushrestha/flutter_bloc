import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simplecardbloc/data/wistlist_item.dart';
import 'package:simplecardbloc/presentation/screens/home/home_models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishinitialEvent>(wishinitialEvent);
    on<WishRemoveEvent>(wishRemoveEvent);
  }
  FutureOr<void> wishinitialEvent(
      WishinitialEvent event, Emitter<WishlistState> emit) {
    emit(WishSuccessState(homeModels: wishListItem));
  }

  FutureOr<void> wishRemoveEvent(
      WishRemoveEvent event, Emitter<WishlistState> emit) {
    wishListItem.remove(event.homeModels);
    emit(WishSuccessState(homeModels: wishListItem));
  }
}
