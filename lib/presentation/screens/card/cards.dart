part of 'card_imports.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardState();
}

class _CardState extends State<Cards> {
  final CardBloc cardBloc = CardBloc();

  @override
  void initState() {
    cardBloc.add(CardinitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Items"),
      ),
      body: BlocConsumer<CardBloc, CardState>(
        bloc: cardBloc,
        listenWhen: (previous, current) => current is CardActionState,
        buildWhen: (previous, current) => current is! CardActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CardSuccessState:
              final successData = state as CardSuccessState;
              return ListView.builder(
                itemCount: successData.homeModels.length,
                itemBuilder: (context, index) {
                  return CardTile(
                      homeModels: successData.homeModels[index],
                      cardBloc: cardBloc);
                },
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
