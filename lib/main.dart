import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences_app/providers/theme_provider.dart';
import 'package:user_preferences_app/screens/screens.dart';
import 'package:user_preferences_app/share_preferences/preferences.dart';





void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode) )
      ],
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Quitar el banner del debug
      debugShowCheckedModeBanner: false,

      //Titulo de aplicacion
      title: 'Material App',
      
      //Ruta inicial
      initialRoute: HomeScreen.routerName,

      //Rutas
      routes: {
        HomeScreen.routerName: ( _ ) => const HomeScreen(),
        SettingScreen.routerName: ( _ ) => const SettingScreen(),
      },

      //tema de la app
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}