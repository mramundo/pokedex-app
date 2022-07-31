import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/styles/text_styles.dart';

class PokemonType extends StatelessWidget {
  static const String grass = 'grass';
  static const String fire = 'fire';
  static const String water = 'water';
  static const String bug = 'bug';
  static const String normal = 'normal';
  static const String poison = 'poison';
  static const String electric = 'electric';
  static const String ground = 'ground';
  static const String fairy = 'fairy';
  static const String fighting = 'fighting';
  static const String psychic = 'psychic';
  static const String rock = 'rock';
  static const String ghost = 'ghost';
  static const String ice = 'ice';
  static const String dragon = 'dragon';
  static const String flying = 'flying';
  static const String dark = 'dark';
  static const String steel = 'steel';

  const PokemonType({
    Key key,
    @required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Text(
      type,
      style: subtitleTextStyle.copyWith(
        color: _typeColor(type),
      ),
    );
  }

  _typeColor(tyoe) {
    Color color = subtitleTextStyle.color;

    switch (type) {
      case PokemonType.grass:
        color = const Color(0xFF78C850);
        break;
      case PokemonType.fire:
        color = const Color(0xFFF08030);
        break;
      case PokemonType.water:
        color = const Color(0xFF6890F0);
        break;
      case PokemonType.bug:
        color = const Color(0xFFA8B820);
        break;
      case PokemonType.normal:
        color = const Color(0xFFA8A878);
        break;
      case PokemonType.poison:
        color = const Color(0xFFA040A0);
        break;
      case PokemonType.electric:
        color = const Color(0xFFF8D030);
        break;
      case PokemonType.ground:
        color = const Color(0xFFE0C068);
        break;
      case PokemonType.fairy:
        color = const Color(0xFFEE99AC);
        break;
      case PokemonType.fighting:
        color = const Color(0xFFC03028);
        break;
      case PokemonType.psychic:
        color = const Color(0xFFF85888);
        break;
      case PokemonType.rock:
        color = const Color(0xFFB8A038);
        break;
      case PokemonType.ghost:
        color = const Color(0xFF705898);
        break;
      case PokemonType.ice:
        color = const Color(0xFF98D8D8);
        break;
      case PokemonType.dragon:
        color = const Color(0xFF7038F8);
        break;
      case PokemonType.flying:
        color = const Color(0xFFA890F0);
        break;
      case PokemonType.dark:
        color = const Color(0xFF705848);
        break;
      case PokemonType.steel:
        color = const Color(0xFFB8B8D0);
        break;
    }

    return color;
  }
}
