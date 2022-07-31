import 'package:flutter/material.dart';
import 'package:pokedex_app/core/models/pokemon.dart';
import 'package:pokedex_app/ui/styles/colors.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';
import 'package:pokedex_app/ui/widgets/square_icon_button.dart';
import 'package:get/get.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailPage({Key key, @required this.pokemon}) : super(key: key);

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
            Text(
              pokemon.name,
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Image.asset(
                'assets/images/${pokemon.image}',
                scale: 1.25,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                for (var type in pokemon.type)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      type,
                      style: subtitleTextStyle,
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      pokemon.description,
                      style: bodyTextStyle,
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
