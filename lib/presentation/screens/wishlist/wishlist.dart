part of 'wishlist_imports.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishinitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishActionState,
        buildWhen: (previous, current) => current is! WishActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishSuccessState:
              final successData = state as WishSuccessState;
              return ListView.builder(
                itemCount: successData.homeModels.length,
                itemBuilder: (context, index) {
                  return WishTile(
                      homeModels: successData.homeModels[index],
                      wishlistBloc: wishlistBloc);
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
