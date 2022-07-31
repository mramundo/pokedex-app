import 'package:flutter/material.dart';
import 'package:pokedex_app/core/models/pokemon.dart';
import 'package:pokedex_app/ui/pages/pokemon_detail_page.dart';
import 'package:pokedex_app/ui/styles/colors.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';
import 'package:get/get.dart';

enum TileType {
  square,
  verRect,
  horRect,
}

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;
  final TileType tileType;
  const PokemonTile({
    Key key,
    @required this.pokemon,
    @required this.tileType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => PokemonDetailPage(pokemon: pokemon),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name,
              maxLines: 3,
              style: tileTextStyle.copyWith(
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/${pokemon.image}',
                scale: 2.5,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(pokemon.number,
                        style: subtitleTextStyle.copyWith(
                          fontSize: 10,
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
