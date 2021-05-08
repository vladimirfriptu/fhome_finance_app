import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppRouter.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'ru_UA';

  final store = Store<AppState>(
    appStateReducer,
    middleware: [thunkMiddleware, new LoggingMiddleware.printer()],
    initialState: AppState.initialState(),
  );

  runApp(FlutterReduxApp(store: store));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;

  FlutterReduxApp({@required this.store});

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(store: store, child: AppRouter());
  }
}
