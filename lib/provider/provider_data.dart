import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier{
  bool isEqualPressed = false;
  String inputText = '';
  String outputText = '';
  String inputExpression = '';
  List<String> operator = ['+', '-', '*', '/'];
  late double finalValue;

  calculation(String buttonText){
    buttonText = buttonText.replaceAll('x', '*');
    buttonText = buttonText.replaceAll('÷', '/');
    isEqualPressed = false;

    if(operator.contains(buttonText)){
      if(operator.contains(inputText[inputText.length-1])){
        _deleteLastDigit();
      }
      inputText = inputText+buttonText;
      _subCalculation();
    } else if(buttonText == '⌫') {
      _deleteLastDigit();
    } else if(buttonText == 'C'){
      _clearAllData();
    } else if(buttonText == '='){
      _subCalculation();
      isEqualPressed = true;
      inputText = outputText;
    } else {
      inputText = inputText + buttonText;
      _subCalculation();
    }
  }

  _subCalculation(){
    try{
      inputExpression = inputText;
      Parser parser = Parser();
      Expression expression = parser.parse(inputExpression);
      ContextModel contextModel = ContextModel();
      finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
      outputText = finalValue.toString();
    } catch(e){}
  }
  
  _deleteLastDigit(){
    if(inputText.isNotEmpty){
      inputText = inputText.substring(0, inputText.length-1);
    }
  }
  
  _clearAllData(){
    inputText = '';
    inputExpression = '';
    finalValue = 0;
    outputText='';
  }

}






// import 'package:flutter/cupertino.dart';
// import 'package:math_expressions/math_expressions.dart';
//
// class ProviderData extends ChangeNotifier{
//   bool isEqualPressed = false;
//   int value = 0;
//   String inputText = '';
//   String outputText = '';
//   String inputExpression = '';
//   increment(){
//     value++;
//     notifyListeners();
//   }
//   calculation(String buttonText){
//     if(inputText.isNotEmpty){
//       if(inputText[inputText.length-1]=='+'||
//           inputText[inputText.length-1]=='-'||
//           inputText[inputText.length-1]=='x'||
//           inputText[inputText.length-1]=='÷'
//       ){
//         if(buttonText=='+'||buttonText=='-'||buttonText=='x'||buttonText=='÷'){
//           inputText=inputText.substring(0, inputText.length-1);
//         }
//       }
//     }
//
//
//     if(buttonText == '⌫' && inputText.isNotEmpty){
//       inputText = inputText.substring(0, inputText.length-1);
//     } else if(buttonText == 'C'){
//       value = 0;
//       inputText = '';
//       outputText = '';
//       inputExpression = '';
//     } else {
//       inputText = inputText+buttonText;
//     }
//
//
//
//     inputExpression = inputText.replaceAll('x', '*');
//     inputExpression = inputExpression.replaceAll('÷', '/');
//
//
//     try{
//       if(inputExpression[inputExpression.length-1] == '+' || inputExpression[inputExpression.length-1]=='-'||
//       inputExpression[inputExpression.length-1]=='/' || inputExpression[inputExpression.length-1]=='*'){
//         inputExpression = inputExpression.substring(0, inputExpression.length-1);
//       }
//
//       Parser parser = Parser();
//       Expression expression = parser.parse(inputExpression);
//       ContextModel contextModel = ContextModel();
//       var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
//       outputText = finalValue.toString();
//       if(inputText.isEmpty) outputText='';
//       print('yes');
//     } catch (e){
//       print(e);
//       print(inputExpression);
//     }
//     if(buttonText == '='){
//       isEqualPressed = true;
//       inputText = outputText;
//     } else {
//       isEqualPressed = false;
//     }
//   }
// }