part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class CardinitialEvent extends CardEvent {}

class CardRemoveEvent extends CardEvent {
  final HomeModels homeModels;

  CardRemoveEvent({required this.homeModels});
}
