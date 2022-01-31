import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Include generated file
part 'app_state.g.dart';

// This is the class used by rest of your codebase
class AppState = _AppState with _$AppState;

// The store-class
abstract class _AppState with Store {
  final Completer<SharedPreferences> _sharedPrefs = Completer<SharedPreferences>();

  //constructor
  _AppState(){
    _init();
  }
  _init() async{
    _sharedPrefs.complete(await SharedPreferences.getInstance());
    var sp = await _sharedPrefs.future;
     value = sp.getInt('counter') ?? 88;
     print(value);
  }

  @observable
  int value = 0;

  @action
  Future increment() async{
    var sp = await _sharedPrefs.future;
    sp.setInt('counter',  value++);
  }
}