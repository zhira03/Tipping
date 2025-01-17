import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipme/providers/ThemeProvider.dart';

class ToggleThemeIcon extends StatelessWidget {
  const ToggleThemeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon:
          Icon(!themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
      onPressed: () {
        themeProvider.toggle();
      },
    );
  }
}
