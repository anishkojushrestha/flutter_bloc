part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final HomeBloc homeBloc = HomeBloc();
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      //buildWhen: (previous, current) => current != previous,
      listener: (context, state) {
        if (state is HomeNavigatetoCardListPageActionState) {
          Navigator.pushNamed(context, "/card");
        } else if (state is HomeNavigatetoWishListPageActionState) {
          Navigator.pushNamed(context, "/wish");
        } else if (state is HomeProductItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Wish List Added")));
        } else if (state is HomeProductItemCardListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Card List Added")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successData = state as HomeLoadedSuccessState;
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
              body: ListView.builder(
                itemCount: successData.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                      homeBloc: homeBloc,
                      homeModels: successData.productList[index]);
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
