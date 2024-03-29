part of 'card_bloc.dart';

@immutable
abstract class CardState {}

abstract class CardActionState extends CardState {}

class CardInitial extends CardState {}

class CardSuccessState extends CardState {
  final List<HomeModels> homeModels;

  CardSuccessState({required this.homeModels});
}
