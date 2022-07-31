import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_app/core/controllers/pokemon_detail_controller.dart';
import 'package:pokedex_app/core/models/pokemon.dart';
import 'package:pokedex_app/ui/styles/colors.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type.dart';
import 'package:pokedex_app/ui/widgets/square_icon_button.dart';
import 'package:get/get.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonDetailPage({Key key, @required this.pokemon}) : super(key: key);

  final Pokemon pokemon;
  final _pokemonDetailController = Get.put(PokemonDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SquareIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          _shinyButton(),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  pokemon.name,
                  style: titleTextStyle,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "#${pokemon.number}",
                      style: subtitleTextStyle.copyWith(
                        fontSize: 28,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(() {
              return Center(
                child: Image.asset(
                  'assets/images/${_pokemonDetailController.shiny.value ? pokemon.imageShiny : pokemon.image}',
                  scale: 1.25,
                ),
              );
            }),
            const SizedBox(
              height: 36,
            ),
            Text(
              "Type",
              style: subtitleTextStyle,
            ),
            Wrap(
              spacing: 8,
              children: [
                for (var type in pokemon.type) PokemonType(type: type)
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Weakness",
              style: subtitleTextStyle,
            ),
            Wrap(
              spacing: 8,
              children: [
                for (var weakness in pokemon.weakness)
                  PokemonType(type: weakness)
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Weight", style: subtitleTextStyle),
                    Text("${_weight(pokemon.weight)}kg", style: bodyTextStyle),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Height", style: subtitleTextStyle),
                      Text("${_height(pokemon.height)}", style: bodyTextStyle),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "DEX Entry",
              style: subtitleTextStyle,
            ),
            Text(
              pokemon.description,
              style: bodyTextStyle,
            )
          ],
        ),
      ),
    );
  }

  _shinyButton() {
    return Obx(() {
      return SquareIconButton(
          onTap: () {
            _pokemonDetailController.toggleShiny();
          },
          icon: _pokemonDetailController.shiny.value
              ? Icons.auto_awesome
              : Icons.auto_awesome_outlined);
    });
  }

  _weight(int weight) {
    return _round(weight / 1000, 2);
  }

  _height(double height) {
    var meters = _round(height / 100, 2);
    return meters < 1 ? "${_round(height, 2)}cm" : "${meters}m";
  }

  _round(double value, int decimals) {
    var mod = pow(10.0, decimals);

    return ((value * mod).round().toDouble() / mod);
  }
}
