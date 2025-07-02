import 'package:flutter/material.dart';
import 'package:movies/authentication/app_services/storage_service.dart';
import 'package:movies/provider/language_provider.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await StorageService.getToken();
  runApp(

    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Movies(token: token,),
    ),
  );
}
