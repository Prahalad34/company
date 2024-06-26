import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Constants/ConstantsText.dart';
import 'package:yakcompany/Constants/SharedPreference.dart';
import 'package:yakcompany/Screens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US')],
    path: 'lib/lang',
    // <-- change the path of the translation files
    fallbackLocale: const Locale('en', 'US'),
    saveLocale: true,
    startLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.whiteColor,
    // navigation bar color
    statusBarColor: AppColors.whiteColor,
    // status bar color
    statusBarBrightness: Brightness.dark,
    //status bar brightness
    statusBarIconBrightness: Brightness.dark,
    //status barIcon Brightness
    // systemNavigationBarDividerColor: Colors.greenAccent,
    //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  initState() {
    super.initState();
    SharedPreference.getBool(ConstantsText.isLogin)
        .then((value) => setState(() {
      isLogin = value ?? false;
    }));

  }


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            textTheme: GoogleFonts.dmSansTextTheme(
              Theme.of(context).textTheme,
            ),
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.deepOrange,
            useMaterial3: true
        ),
        home: isLogin ? buildHomeView() : buildLoginView()


    );
  }
  Widget buildHomeView()=>  const Login();
  Widget buildLoginView()=>  const Login();

}
