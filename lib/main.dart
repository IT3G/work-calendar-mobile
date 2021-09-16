import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/navigation/navigation_container.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                CupertinoApp(
                  home: NavigationContainer(),
                )));
  }
}
