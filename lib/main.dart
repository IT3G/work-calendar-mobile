import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:work_calendar/navigation/navigation_container.dart';
import 'package:work_calendar/store/storage.dart';
import 'package:work_calendar/store/store.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: StoreProvider(
            store: store,
            child: FutureBuilder(
              future: Storage.ready,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  const MaterialApp(
                home: NavigationContainer(),
              ),
            )));
  }
}
