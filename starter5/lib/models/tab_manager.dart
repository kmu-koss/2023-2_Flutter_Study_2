import 'package:flutter/cupertino.dart';

class TabManger extends ChangeNotifier{
  int selectedTab= 0;

  void goToTab(int index){
    selectedTab = index;
    notifyListeners();
  }

  void goToRecipes(){
    selectedTab = 1;
    notifyListeners();
  }
}