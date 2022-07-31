import 'package:flutter/cupertino.dart';

class Pokemon {
  int id;
  String number;
  String code;
  String name;
  String description;
  List<dynamic> type;
  List<dynamic> weakness;
  int weight;
  double height;
  String sprite;
  String image;
  String imageShiny;

  Pokemon({
    this.id,
    @required this.number,
    @required this.code,
    @required this.name,
    @required this.description,
    @required this.type,
    @required this.weakness,
    @required this.weight,
    @required this.height,
    @required this.sprite,
    @required this.image,
    @required this.imageShiny,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json["number"];
    code = json["code"];
    name = json["name"];
    description = json["description"];
    type = json["type"];
    weakness = json["weakness"];
    weight = json["weight"];
    height = json["height"];
    sprite = json["sprite"];
    image = json["image"];
    imageShiny = json["image_shiny"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> pokemon = <String, dynamic>{};

    pokemon['id'] = id;
    pokemon['number'] = number;
    pokemon['code'] = code;
    pokemon['name'] = name;
    pokemon['description'] = description;
    pokemon['type'] = type;
    pokemon['weakness'] = weakness;
    pokemon['weight'] = weight;
    pokemon['height'] = height;
    pokemon['sprite'] = sprite;
    pokemon['image'] = image;
    pokemon['image_shiny'] = imageShiny;

    return pokemon;
  }
}
