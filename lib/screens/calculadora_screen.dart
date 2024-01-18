import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_calculadora/controllers/calculadora_controller.dart';

import 'package:flutter_calculadora/widgets/calculos.dart';
import 'package:flutter_calculadora/widgets/boton.dart';


class CalculadoraScreen extends StatelessWidget {

  final calculatorCtrl = Get.put( CalculatorController() );

  @override
  Widget build(BuildContext context) {
    return Scaffold( //estructura de la calculadora
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 95, 169),
        title: const Text('Calculadora', style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea( //se asegura que no se sobrepongan los elementos
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [              
              Expanded(
                child: Container(),
              ),
              
              CalculoMat(),                    

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: CalculadoraButton( 
                    texto: 'C',
                    bgColor: const Color.fromARGB(255, 231, 233, 243),
                    onPressed: () => calculatorCtrl.resetAll(),
                  )),             
                  CalculadoraButton( 
                    texto: '/',
                    bgColor: const Color.fromARGB(255, 231, 233, 243),
                    onPressed: () => calculatorCtrl.seleccionarOperacion('/'),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '7',
                      onPressed: () => calculatorCtrl.addNumero('7'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '8',
                      onPressed: () => calculatorCtrl.addNumero('8'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '9',
                      onPressed: () => calculatorCtrl.addNumero('9'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: 'X',
                      bgColor: const Color.fromARGB(255, 231, 233, 243),
                      onPressed: () => calculatorCtrl.seleccionarOperacion('X'),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '4', 
                      onPressed: () => calculatorCtrl.addNumero('4'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '5', 
                      onPressed: () => calculatorCtrl.addNumero('5'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '6', 
                      onPressed: () => calculatorCtrl.addNumero('6'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '-',
                      bgColor: const Color.fromARGB(255, 231, 233, 243),
                      onPressed: () => calculatorCtrl.seleccionarOperacion('-'),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '1', 
                      onPressed: () => calculatorCtrl.addNumero('1'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '2', 
                      onPressed: () => calculatorCtrl.addNumero('2'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '3', 
                      onPressed: () => calculatorCtrl.addNumero('3'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton(
                      texto: '+',  
                      bgColor: const Color.fromARGB(255, 231, 233, 243),
                      onPressed: () => calculatorCtrl.seleccionarOperacion('+'),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '+/-',
                      onPressed: () => calculatorCtrl.cambiarNegativoPositivo(),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '0',
                      onPressed: () => calculatorCtrl.addNumero('0'),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '.', 
                      onPressed: () => calculatorCtrl.addDecimalPoint(),
                    ),
                  ),
                  Expanded(
                    child: CalculadoraButton( 
                      texto: '=',
                      bgColor: const Color.fromARGB(255, 31, 95, 169),
                      textColor: Colors.white,
                      onPressed: () => calculatorCtrl.calcularResultado(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}