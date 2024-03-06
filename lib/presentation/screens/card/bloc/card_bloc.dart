import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simplecardbloc/data/card_item.dart';
import 'package:simplecardbloc/presentation/screens/home/home_models.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardinitialEvent>(cardinitialEvent);
    on<CardRemoveEvent>(cardRemoveEvent);
  }

  FutureOr<void> cardinitialEvent(
      CardinitialEvent event, Emitter<CardState> emit) {
    emit(CardSuccessState(homeModels: cardItemList));
  }

  FutureOr<void> cardRemoveEvent(
      CardRemoveEvent event, Emitter<CardState> emit) {
    cardItemList.remove(event.homeModels);
    emit(CardSuccessState(homeModels: cardItemList));
  }
}
