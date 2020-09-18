import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  
  // crashlytics Code
  // runZonedGuarded(() {
  //   init();
  // }, (error, stackTrace) {
  //   print('runZonedGuarded: Caught error in my root zone.');
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });
  // await initializeFlutterFire();
}

// Initializes required data
init() async {
  await AppManager.initSharedPreference();
  Widget _defaultWidget = getDefaultWidget();
  runApp(MyApp(defaultWidget: _defaultWidget));
}

Widget getDefaultWidget() {
  Widget _defaultWidget = new LoginScreen();
  if (AppManager.instance.sharedPreferenceRepository.isLoggedIn()) {
    _defaultWidget = new HomeScreen(arguments: HomeScreenArguments(
      title: "",
      message: ""
    ));
  } else {
    _defaultWidget = new LoginScreen();
  }
  return _defaultWidget;
}

class MyApp extends StatelessWidget {
  final Widget defaultWidget;

  MyApp({this.defaultWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false, // 'DEBUG' banner at the topright conner while in debug mode
      home: defaultWidget,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
