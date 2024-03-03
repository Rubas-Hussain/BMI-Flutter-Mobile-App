import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{

//   bool _maleBtn=true;
//   bool get maleBtn=>_maleBtn;
//
//   void switchColorMale(value){
//     // maleBtn.
//   }
// }

    // Getting and storing height value from slider
    double _currentHeightValue=1.2;
    get currentHeightValue=>_currentHeightValue;
    void setHeightValue(double sliderValue){
      _currentHeightValue=sliderValue;
      notifyListeners();
    }

    // Getting and storing weight value from slider
    int _currentWeightValue=20;
    get currentWeightValue=>_currentWeightValue;
    void setWeightValue(double sliderValue){
      _currentWeightValue=sliderValue.round();
      notifyListeners();
    }

    // Calculating bmi and storing it in a variable
    double _bmi=0.0;
    get bmi=>_bmi;
    void calculateBmi(){
      _bmi=_currentWeightValue/(_currentHeightValue*_currentHeightValue);
      print(_bmi.toStringAsFixed(2));
      notifyListeners();
    }

    // save icon is being changed ontap
    bool _saveIcon=false;
    get saveIcon=>_saveIcon;
    void toggleSaveIcon(){
      _saveIcon=!_saveIcon;
      notifyListeners();
    }
}