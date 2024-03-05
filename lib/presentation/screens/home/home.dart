part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigatetoCardListPageActionState) {
          Navigator.pushNamed(context, "/card");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Grocery App"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishListButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCardButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
