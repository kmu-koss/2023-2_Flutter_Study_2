import 'package:flutter/cupertino.dart';
// ChangeNotifier가 TabManger와 연결된 위젯에게 알려줌
class TabManger extends ChangeNotifier{
  int _selectedTab= 0;

  int get selectedTab =>_selectedTab;

  void goToTab(int index){
    _selectedTab = index;
    // TabManger에게 보고하고있는 위젯들에게 값 변경하라고 알림. 명령
    notifyListeners();

  }

  void goToRecipes(){
    _selectedTab = 1;
    notifyListeners();
  }
}

