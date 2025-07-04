import 'package:flutter/material.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const Movies(),
    ),
  );
}
