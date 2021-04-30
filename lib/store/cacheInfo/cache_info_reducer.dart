import 'package:flutter_app/models/CacheInfoModel.dart';
import 'package:redux/redux.dart';

import 'cache_info_actions.dart';

List<CacheInfoModel> addCacheInfoReducer(List<CacheInfoModel> state, action) =>
    []..addAll(state)..addAll(action.cacheInfoList);

final Reducer<List<CacheInfoModel>> cacheInfoReducer = combineReducers<List<CacheInfoModel>>([
  new TypedReducer<List<CacheInfoModel>, AddCacheInfoAction>(addCacheInfoReducer),
]);
