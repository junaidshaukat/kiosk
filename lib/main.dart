import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await HiveBox.initHive();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => PreferenceProvider(c)),
          ChangeNotifierProvider(create: (c) => ConnectivityProvider(c)),
          ChangeNotifierProvider(create: (c) => ApiProvider(c)),
          ChangeNotifierProvider(create: (c) => AuthenticationProvider(c)),
          ChangeNotifierProvider(create: (c) => SplashProvider(c)),
          //
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: 'music',
                debugShowCheckedModeBanner: false,
                theme: theme,
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [Locale('en', '')],
                initialRoute: AppRoutes.splash,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
