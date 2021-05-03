import 'package:flutter_app/providers/gsheets.dart';
import 'package:flutter_app/store/AppStateModel.dart';
import 'package:flutter_app/store/category/category_actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class CategoryThunks {
  static ThunkAction<AppState> fetchAllCategories() => (Store<AppState> store) async {
    final categories = await fhomeFinanceSheet.getCategories();

    store.dispatch(SetCategoriesAction(payload: categories));
  };
}
