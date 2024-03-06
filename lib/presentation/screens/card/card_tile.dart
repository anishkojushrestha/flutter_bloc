import 'package:flutter/material.dart';
import 'package:simplecardbloc/presentation/screens/card/bloc/card_bloc.dart';
import 'package:simplecardbloc/presentation/screens/home/home_models.dart';

class CardTile extends StatelessWidget {
  final HomeModels homeModels;
  const CardTile({super.key, required this.homeModels, required this.cardBloc});
  final CardBloc cardBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(homeModels.img))),
          ),
          Text(
            "Name: ${homeModels.name}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("Description: ${homeModels.desc}"),
          Row(
            children: [
              Text("Price: ${homeModels.price.toString()}"),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    // cardBloc.add(HomeProductWishListButtonClickEvent(
                    //     homeModels: homeModels));
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    // cardBloc.add(HomeProductCardButtonClickEvent(
                    //     homeModels: homeModels));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))
            ],
          )
        ],
      ),
    );
  }
}
