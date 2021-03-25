import 'dart:math';

class CalculatorBrain {
  int h;
  int w;
  CalculatorBrain ({this.h, this.w});

  double _bodyMassIndex;

 String calculateBMI(){
   _bodyMassIndex = w/pow(h/100, 2);
  return _bodyMassIndex.toStringAsFixed(1);
}

String getResult (){
   if (_bodyMassIndex >= 25){
     return 'Overweight';
   } else if (_bodyMassIndex > 18.5){
     return 'Normal';
   } else {
       return 'Underweight';
   }
   }

   String getInterpretation(){

     if (_bodyMassIndex >= 25){
       return 'Your BMI is higher than normal. You need to exercise more!';
     } else if (_bodyMassIndex > 18.5){
       return 'Your BMI is normal. Good job!';
     } else {
       return 'Your BMI is lower than normal. You should eat more!';
     }
   }
}
