import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_app/ui/pages/home_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: "PokeDEX",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
