import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool isDarkMode =
    SchedulerBinding.instance.window.platformBrightness != Brightness.dark;

Color primaryColor = isDarkMode ? Colors.black : Colors.white;

Color secondaryColor =
    isDarkMode ? const Color(0xFF3B3B3B) : Colors.grey.shade100;

Color textColor = isDarkMode ? Colors.white : Colors.black;

Color secondaryTextColor = isDarkMode ? Colors.grey : Colors.grey;

Color iconColor = isDarkMode ? Colors.white : Colors.black;
