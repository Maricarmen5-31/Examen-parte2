import 'dart:math';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  
  //variables observables: notifican a la IU cuando cambian sus valores y se actualiza automáticamente la UI de acuerdo con esos cambios
  var primerNumero  = ''.obs;
  var operacion     = ''.obs;
  var segundoNumero = ''.obs;
  var signoResult   = ''.obs;
  var resultado     = '0'.obs;
  

  //método restablece todos los valores de la
  resetAll() {
    primerNumero.value  = '';
    operacion.value     = '';
    segundoNumero.value = '';
    signoResult.value   = '';
    resultado.value     = '0';    
  }

  cambiarNegativoPositivo() {
    if ( resultado.startsWith('-') ) {
        resultado.value = resultado.value.replaceFirst('-', '');
    } else {
      resultado.value = '-${resultado.value}';
    }
  }

  addNumero( String number ) {
    if ( resultado.value == '0' ) {
      return resultado.value = number;
    }
    if ( resultado.value == '-0' ) {
      return resultado.value = '-$number';
    }
    if ( resultado.value == 'No se puede dividir entre cero') {
      resetAll();
      return resultado.value = number;
    }
    if (primerNumero.isEmpty && operacion.isEmpty && segundoNumero.isEmpty && signoResult.isNotEmpty) {
      return resultado.value = number;
    }
    if ( operacion.isNotEmpty ) {
      return resultado.value = number;
    }
    resultado.value = resultado.value + number;
  }

  addDecimalPoint() {
    if ( resultado.contains('.') ) return;
    if ( resultado.startsWith('0') ){
      resultado.value = '0.';
    } else {
      resultado.value = '${resultado.value}.';
    }
  }

  seleccionarOperacion( String newOperation ) {
    operacion.value   = newOperation;
    primerNumero.value = resultado.value;
    segundoNumero.value = '';
    signoResult.value = '';
    //resultado.value  = '0';
  }

  deleteLastEntry() {
    if ( resultado.value.replaceAll('-', '').length > 1 ) {
      resultado.value = resultado.value.substring(0, resultado.value.length - 1 );
    } else {
      resultado.value = '0';
    }
  }

  calcularResultado() {
    if(primerNumero.value == '' && segundoNumero.value == '') {
      resultado.value = resultado.value;
      return;
    }
    double num1 = double.parse( primerNumero.value );
    double num2 = double.parse( resultado.value );

    segundoNumero.value = resultado.value;
    signoResult.value = "=";

    switch( operacion.value ){
      case '+':
        resultado.value = '${ num1 + num2 }';
      break;

      case '-':
        resultado.value = '${ num1 - num2 }';
      break;

      case '/':
        if( resultado.value == '0' ) {
          resultado.value = 'No se puede dividir entre cero';
        } else {
          resultado.value = '${ num1 / num2 }';
        }        
      break;

      case 'X':
        resultado.value = '${ num1 * num2 }';
      break;

      default:
        return;
    }
    if ( resultado.value.endsWith('.0') ) {
      resultado.value = resultado.value.substring(0, resultado.value.length - 2 );
    }
  }
  calcularFraccion() {
    primerNumero.value = '1';
    operacion.value = '/';
    segundoNumero.value = resultado.value;
    signoResult.value = '=';
    resultado.value ='${1 / double.parse(resultado.value)}';
  }
  calcularPotencia2() {
    primerNumero.value = '';
    operacion.value = '';
    segundoNumero.value = '';
    signoResult.value = 'sqr(${resultado.value})';
    resultado.value ='${double.parse(resultado.value) * double.parse(resultado.value)}';
  }
  calcularRaiz2() {
    primerNumero.value = '';
    operacion.value = '';
    segundoNumero.value = '';
    signoResult.value = 'v(${resultado.value})';
    resultado.value ='${sqrt(double.parse(resultado.value))}';
  }
}