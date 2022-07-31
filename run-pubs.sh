#!/bin/sh

generate_splashscreen() {
  flutter pub run flutter_native_splash:create
}

generate_icons() {
  flutter pub run flutter_launcher_icons:main
}

generate_splashscreen
generate_icons
