import 'package:flutter_calculadora/controllers/calculadora_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculoMat extends StatelessWidget {
  
  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    
    return Obx( 
      () => Row(
        children: [
          Expanded(child: Numero( text: '${ calculatorCtrl.primerNumero }' )),
          Expanded(child: Operacion( text: '${ calculatorCtrl.operacion }' )),
          Expanded(child: Numero( text: '${ calculatorCtrl.segundoNumero }' )),
          Expanded(child: Operacion( text: '${ calculatorCtrl.signoResult }' )),
          Expanded(child: Resultado( text: '${ calculatorCtrl.resultado }' )),          
        ],
      )
    );
  }
}

class Numero extends StatelessWidget {
  final String text;
  const Numero({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 3, color: const Color.fromARGB(255, 198, 198, 198)),
      ),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Center( child: Text( text , style: const TextStyle(fontSize: 30, color: Colors.black ) ),),
    );
  }
}

class Operacion extends StatelessWidget {
  final String text;
  const Operacion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Center(child: Text( text , style: const TextStyle(fontSize: 30, color: Colors.black ) )),
    );
  }
}


class Resultado extends StatelessWidget {
  final String text;

  const Resultado({ 
    Key? key, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( bottom: 20 ),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text( text , style: const TextStyle(fontSize: 65, color: Colors.black) )
      ),
    );
  }
}