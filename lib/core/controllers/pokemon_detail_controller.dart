import 'package:get/get.dart';

class PokemonDetailController extends GetxController {
  final shiny = false.obs;

  @override
  void onReady() {
    setShiny(false);
    super.onReady();
  }

  void setShiny(bool value) {
    shiny.value = value;
  }

  void toggleShiny() {
    shiny.value = !shiny.value;
  }
}
