import 'package:flutter/material.dart';
import 'package:pokedex_app/core/controllers/pokemon_controller.dart';
import 'package:pokedex_app/ui/styles/colors.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';
import 'package:pokedex_app/ui/widgets/pokemon_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final _pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 16,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "PokeDEX",
            style: titleTextStyle.copyWith(fontSize: 32),
          )
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (_pokemonController.pokemonList.isNotEmpty) {
          return AlignedGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: _pokemonController.pokemonList.length,
              itemBuilder: (context, index) {
                return PokemonTile(
                  tileType: TileType.square,
                  pokemon: _pokemonController.pokemonList[index],
                );
              });
        } else {
          return Center(
            child: Text("", style: titleTextStyle),
          );
        }
      }),
    ));
  }
}
