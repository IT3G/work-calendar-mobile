import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/navigation/navigation_container.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: FutureBuilder(
            future: Storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                CupertinoApp(
                  localizationsDelegates: [
                    GlobalCupertinoLocalizations.delegate,
                    // ... app-specific localization delegate[s] here
                    SfGlobalLocalizations.delegate
                  ],
                  //ignore: always_specify_types
                  supportedLocales: const [
                    Locale('ru'),
                    // ... other locales the app supports
                  ],
                  locale: const Locale('ru'),
                  home: NavigationContainer(),
                  theme: CupertinoThemeData(brightness: Brightness.light),
                )));
  }
}
